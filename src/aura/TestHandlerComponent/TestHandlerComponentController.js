({
	handleComponentEventFired : function(component, event, helper) {
           var context = event.getParam("testParamerter");
           component.set("v.mostRecentEvent",
                         "Most recent event handled: COMPONENT event, from " + context);
        
		
	}
})