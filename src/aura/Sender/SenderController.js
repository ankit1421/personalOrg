({
	send : function(component, event, helper) {
		var jstext = event.source.get("v.label");
        $A.get("e.c:Message").setParams({
            AnkitApp:jstext
        }).fire();
	}
})