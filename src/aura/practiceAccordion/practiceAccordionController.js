/**
 * Created by Ankit on 3/23/18.
 */
({
    doInit : function(component,event,helper){
            var action = component.get('c.getAccounts');
            action.setCallback(this,function(response){
                console.log('response', response);
                component.set('v.accounts',response.getReturnValue());
            });
            $A.enqueueAction(action);

    }
})