/**
 * Created by Ankit on 3/19/18.
 */
({
    fetchRTValues : function (component,event,helper){
        var action = component.get("c.recordTypeValues");
        action.setCallback(this,function(response){
            console.log('-----' + response.getReturnValue());
            component.set("v.rtList",response.getReturnValue());
        });
        $A.enqueueAction(action);
    },

    createRecord : function(component,event,helper){
        component.set("v.isOpen",true);

        var action = component.get("c.getRecTypeId");
        var recLabel = component.find("selectid").get("v.value");
		console.log('-----' + recLabel);
        action.setParams({
            "rtLabel" : recLabel
        });
		
        action.setCallback(this,function(response){
           var state = response.getState();

           if(state == 'SUCCESS'){
               console.log('-----' + state);
               
               var recId = response.getReturnValue();
               console.log('-----' + recId);
               var createRecordEvent = $A.get("e.force:createRecord");
               createRecordEvent.setParams({
                   "entityApiName":"Account",
                   "recordTypeId": recId
               });
               createRecordEvent.fire();
           } else if (state == "INCOMPLETE") {
               var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                  "title": "Oops!",
                  "message": "No Internet Connection"
               });
               toastEvent.fire();

           } else if (state == "ERROR") {
               var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                  "title": "Error!",
                  "message": "Please contact your administrator"
               });
               toastEvent.fire();
           }
		});
        $A.enqueueAction(action);
    },

    closeModal : function(component,event,helper){
        component.set("v.isOpen",false);
    },

    openModal : function(component,event,helper){
            component.set("v.isOpen",true);
    }
})