({
	helperMethod : function(component,event,ele) {
		var elements = component.getElements();
		console.log('elements',elements.childNodes);
    	//var elements = component.find(ele);
        for(var cmp in elements) {
            console.log('---',elements[cmp]);
         	// $A.util.toggleClass(elements[cmp], 'slds-show');  
        	// $A.util.toggleClass(elements[cmp], 'slds-hide');  
        } 
	}
})