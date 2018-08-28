({
    doInit : function(component,event,helper){
        console.log('- doInit component-',component);
        console.log('-doInit event-',event);
        console.log('-doInit helper-',component);

        component.find("contactRecordCreator").getNewRecord(
            "Contact",
            null,
            false,
            $A.getCallback(function(){
                var rec = component.get("v.newContact");
                var error = component.get("v.newContactError");
                console.log('record',rec);
                if(error || (rec == null)){
                    console.log("Error initializing record template " + error);
                }else{
                    console.log("Record template initialized: " + rec.sObjectType);    
                }
            })
        );
    },
    
    recordUpdated : function(component,event,helper){
        console.log('record updated 11', component);
        console.log('record updated 12', event);
    },

    handleSaveContact : function(component,event,helper){ 
        console.log('-recordUpdated component-',component);
        console.log('-recordUpdated event-',event);
        	console.log('-component.get("v.recordId")-',component.get("v.recordId"));
			component.set("v.simpleNewContact.AccountId",component.get("v.recordId"));
            console.log('-recordUpdated after setting prop-',component);
        	console.log('-component.find("contactRecordCreator") -',component.find("contactRecordCreator"));
            component.find("contactRecordCreator").saveRecord(function(saveResult){
                console.log('-save Results-',saveResult);
                if(saveResult.state === "SUCCESS" ||  saveResult.state === "DRAFT"){
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title" : "Contact Saved",
                        "message": "New Contact Created"
                    });

                    $A.get("e.force:closeQuickAction").fire();
                    resultsToast.fire();

                    $A.get("e.force:refreshView").fire();

                }
                else if (saveResult.state === "INCOMPLETE") {
                    console.log("User is offline, device doesn't support drafts.");
                }
                else if (saveResult.state === "ERROR") {
                    console.log('Problem saving contact, error: ' +
                                JSON.stringify(saveResult.error));
                }
                else {
                    console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
                }    

            });
        
    },
    handleCancel : function(component,event,helper){
        $A.get("e.force:closeQuickAction").fire();
    }  
    
})