({
	checkfortheday : function(component,event,helper) {
            
            var d = new Date ();
            var Weekday = $A.get("$Locale.nameOfWeekdays");
            var n = Weekday[d.getDay()].fullName;
            console.log(n);
            component.set("v.DayOfTheWeek",n);	
	}
})