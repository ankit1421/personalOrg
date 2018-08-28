/**
 * Created by Ankit on 3/23/18.
 */
({
  sectionOne : function(component, event, helper) {
     console.log('find the function');
     var acc = component.find('articleOne');
     acc.forEach(function(element) {
        $A.util.toggleClass(element, "slds-show");
     });
     console.log('event--', event, event.target); 
  }
})