({
	doInit : function(component, event, helper) {
		//console.log('------' + jQuery);
        var action = component.get("c.findAccounts");
        action.setCallback(this,function(response){
            component.set("v.accounts",response.getReturnValue());
        });
        
        $A.enqueueAction(action);
	},
   
    scriptsLoaded : function(component,event,helper){
        
       console.log('--after script loaded-' + jQuery('#table'));
        jQuery('#table').DataTable();
    }
})