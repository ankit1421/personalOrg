({
	getProducts : function(component) {
       debugger;
        $A.log("Ye to chala");
        var action = component.get("c.getProducts");
        $A.log("Ye mhi chala");
       
       debugger;
        action.setCallback(this,function (a) {
            component.set("v.products",a.getReturnValue());                  
        });
         $A.log(action);
       debugger; 
        $A.enqueueAction(action);
         debugger;
	},
    
   getProduct : function(component,productName){
       debugger; 
       var action = component.get("c.getProductsByName");
       debugger;
       action.setParams({"name" : productName});
       debugger;
       action.setCallback(this,function(a){
             console.log(a.getReturnValue());
             component.set("v.product",a.getReturnValue());
        });
       debugger;
        $A.enqueueAction(action);
   },
})    
    
    
    
    
})