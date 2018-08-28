/**
 * Created by Ankit on 3/24/18.
 */
({
    callFunction: function(component,event,helper){
        var spin = component.find('sps');
        //$A.util.toggleClass(spin,'slds-hide');
        console.log('spin-- ', spin);

        var action = component.get('c.getAccounts');
        action.setCallback(this,function(response){
           component.set("v.gotIt", 'Response Recieved');
           $A.util.toggleClass(spin,'slds-hide');
           console.log('----', document.getElementById('sps1'));
           $A.util.toggleClass(document.getElementById('sps1'),'slds-hide');
           console.log('response', response);
           component.set('v.accounts',response.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})