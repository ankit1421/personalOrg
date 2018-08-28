({
	myAction : function(component, event, helper) {
		 //console.log('-component--' + component);
         ///console.log('-event--' + event);
         //console.log('-helper--' + helper);
          
          var action = component.get("c.getContacts");
          action.setCallback(this,function(data){
              var records = data.getReturnValue();
              console.log(records);
              for(var key in records){
                  console.log('Here is the key', key);
                  console.log('here is the data',records[key]);
                  var rec = records[key];
                  for(var field in rec){
                      console.log('---', field);
                      console.log('fields',rec[field]);
                  }
              }
                           component.set("v.contacts",data.getReturnValue());             
                          });
     	$A.enqueueAction(action);
	}
})