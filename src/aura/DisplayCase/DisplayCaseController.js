({
	doInit : function(component, event, helper) {
              var action = component.get("c.getCaseFromId");
               debugger;
               console.log(action);
               action.setParams({
                        caseId : component.get("v.caseId")
                    });
        
        action.setCallback(this,function(response){
           
                 component.set("v.record",response.getReturnValue());
          
        });
           
		$A.enqueueAction (action);
        debugger;
        console.log('------');
	}
})