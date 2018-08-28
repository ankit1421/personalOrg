({
	SendPhoneNumber : function(component, event, helper) {
         var phnumber = event.source.get("v.value");
         console.log($A);
         $A.get("e.c:PhoneNumberEvent").setParams({
            phone:phnumber
       }).fire();		
	}
})