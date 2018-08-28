({
	validateItemForm : function(component, event, helper) {
        
        var isCampingValid = true;
        var nameField = component.find("name");
        var quantityField = component.find("quantity");
        var priceField = component.find("price");
        
        if(nameField.get("v.value") == '' ){
            nameField.set("v.errors",[{message:"name can't be blank"}]);
            isCampingValid = false;
        }
        else{
            nameField.set("v.errors",null);
        }
        
        
        if( quantityField.get("v.value") == '' ){
            quantityField.set("v.errors",[{message:"Quantity can't be blank"}]);
            isCampingValid = false;
        }
        else{
            quantityField.set("v.errors",null);
        }
        
        
        if(priceField.get("v.value") == ''){
            priceField.set("v.errors",[{message:"Price can't be blank"}]);
            isCampingValid = false;
        }
        else{
            priceField.set("v.errors",null); 
        }
        
        return isCampingValid;
     },
  createItem : function(component,newItem) {
        var addEvent = component.getEvent("addItem");
        addEvent.setParams({"item" : newItem});
        addEvent.fire();
        component.set("v.newItem",
                     { 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Packed__c': false,
                    'Price__c': 0,
                    'Quantity__c': 8});
    }
})