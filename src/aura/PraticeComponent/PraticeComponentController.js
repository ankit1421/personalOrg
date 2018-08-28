({
	doInit : function(component, event, helper) {
		var action = component.get("c.ColorObject");
        console.log('---test find---' , component.find("test"));
        console.log('---test studentName---' , component.find("studentName"));
        action.setCallback(this,function(response){
            
            var objectArr = [];
            for(var key in  response.getReturnValue()){
                objectArr.push({
                    key:"White",
                    value:true
                });
            }
           
            component.set('v.colors', objectArr);
        })
        $A.enqueueAction(action);
	}
})