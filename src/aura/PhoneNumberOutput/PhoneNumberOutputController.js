({
	recievePhoneNumber : function(component, event, helper) {
		        var phnum = event.getParam("phone");
                component.set("v.number",phnum);
	}
})