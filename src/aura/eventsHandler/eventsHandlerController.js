/**
 * Created by Ankit on 9/4/17.
 */
({
    handleApplicationEventFired : function(cmp,event){
          var context = event.getParam("context");
          cmp.set("v.mostRecentEvent",
          "Most recent event handled: APPLICATION event, from " + context);
          var numApplicationEventsHandled =
          parseInt(cmp.get("v.numApplicationEventsHandled")) + 1;
          cmp.set("v.numApplicationEventsHandled", numApplicationEventsHandled);
    },

    handleComponentEventFired : function(cmp,event){

        var context = event.getParam("context");
        cmp.set("v.mostRecentEvent",
        "Most recent event handled: COMPONENT event, from " + context);
        var numComponentEventsHandled =
        parseInt(cmp.get("v.numComponentEventsHandled")) + 1;
        cmp.set("v.numComponentEventsHandled", numComponentEventsHandled);

    }
})