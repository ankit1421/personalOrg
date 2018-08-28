({
	fireEvent: function(component, event, helper) {
        var accidentEvent = component.getEvent('readyToHandleAccident');
        console.log('--' + component);
        console.log('====' + JSON.stringify(accidentEvent));
        accidentEvent.setParams({"msgToPass" : "I am passing the message.Do Your job."});
        accidentEvent.fire();
        console.log('==event fired==');
	}
})