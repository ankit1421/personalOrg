({
    doInit: function(component, event, helper) {
        var fetchAccount = component.get("c.getAccName");
        console.log('-YYYY--' + fetchAccount);
        fetchAccount.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                console.log('==fetchAccount=====' + response.toString());
                component.set("v.myFavouriteAccount",response.getReturnValue());
              }   
            
        }) ;
       //console.log('---fetchAccount--' + JSON.stringify(fetchAccount)); 
       console.log('---fetchAccount--' + fetchAccount); 
       $A.enqueueAction(fetchAccount);
        
        
        var fetchClass = component.get("c.getClassInstance");
        fetchClass.setCallback(this,function(response){
            var state = response.getState() ;
            if(state === 'SUCCESS'){
                console.log('==fetchClass=====' + response.toString());
                component.set("v.myFavouriteInstance",response.getReturnValue());
                 
            }    
             
        });
        
       console.log('---fetchClass--' + JSON.stringify(fetchClass));
       console.log('---fetchClass--' + fetchClass); 
        
      $A.enqueueAction(fetchClass);
      
        component.set("v.jsObject", {type:"Fiat", model:"500", color:"white"});        
    }
})