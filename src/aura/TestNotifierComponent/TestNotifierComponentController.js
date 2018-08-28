({
	fireCompEvent : function(component, event, helper) {
		          var NotName = component.get("v.NotifierName");
                  var compEventInstance = component.getEvent("regtestEvent");
        		  compEventInstance.setParams({"testParamerter":NotName});
                  compEventInstance.fire();
	}
})