({
    doInit : function(component,event,helper){
        var action = component.get('c.getAccounts');
        action.setCallback(this,function(response){
            console.log('response', response);
            component.set('v.accounts',response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    togglesection : function(component, event, helper) {
        var headerList = component.find('headerDetail');
        var detailList = component.find('accountDetail');
        var accountCard = component.find('accountCard');

        console.log('component find', headerList,detailList);
        for(var key in headerList){
            var detailComp = headerList[key];
            console.log('---Header KEY--',headerList[key]);
            console.log('--GetElements---',headerList[key].getElements());
        }
        for(var key in detailList){
            var detailComp = detailList[key];
            console.log('---accountDetail KEY--',detailList[key],detailList[key].id);
            console.log('--accountDetail---',detailList[key].getElements());
            console.log('--accountDetail-[0]--',detailList[key].getElements()[0]);
        }

        for(var key in accountCard){
            var detailCard = accountCard[key];
            console.log('---accountCard KEY--',accountCard[key]);
            //console.log('--accountCard---',accountCard[key].getElements());
            //console.log('--accountCard-[0]--',accountCard[key].getElements()[0]);
        }

        console.log('find with component', component.find(event.currentTarget.Id));

        var accDetails = document.getElementById(event.currentTarget.id);
        $A.util.removeClass(accDetails, 'slds-hide');
        $A.util.addClass(accDetails, 'slds-show');

        $A.util.removeClass(detailComp, 'slds-hide');
        $A.util.addClass(detailComp, 'slds-show');

        //$A.util.removeClass(detailCard, 'slds-hide');
        //$A.util.addClass(detailCard, 'slds-show');




    }
})