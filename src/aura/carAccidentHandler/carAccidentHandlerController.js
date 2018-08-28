({
	plshandleEvent : function(component, event, helper) {
        console.log('==hanlder==' + JSON.stringify(event));
        var mess = event.getParam("msgToPass");
        console.log('====' + mess);
        component.set("v.messagefromchild",mess);
	}
})