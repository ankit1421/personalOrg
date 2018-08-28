/**
 * Created by Ankit on 9/4/17.
 */
({

    fireComponentEvent : function (cmp,event){

        var parentName = cmp.get("v.parentName");
        var compEvents = cmp.getEvent("componentEventFired");

        compEvents.setParams({"context":parentName});
        compEvents.fire();

    },

    fireApplicationEvent : function (cmp,event){

        var parentName = cmp.get("v.parentName");

        var appEvent = $A.get("e:c:appEvent");

        appEvent.setParams({"context":parentName});
        appEvent.fire();



    }
})