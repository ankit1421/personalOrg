({
	loadContacts : function(component) {
        var action = component.get("c.getContact")
        action.setCallback(this,function(response){
            console.log('---' + JSON.stringify (response.getReturnValue()));
            component.set("v.contacts",response.getReturnValue());
            console.log('--value set-');
        });
        $A.enqueueAction(action);
		
	}
})