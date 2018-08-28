trigger AcctSubmitAppEntitlement on Account (after insert) {

    static boolean runTrigger= true;
    
    if (runTrigger){
    
        /*List<WEID__c> weids = WEID__c.getall().values();
        Set<Id> validRecordTypeIds = new Set<Id>();

            for (WEID__c weid: weids) {
            try {
                validRecordTypeIds.add(weid.WEAccId__c);
                } catch (System.StringException e) {
                  System.debug(
                    System.LoggingLevel.ERROR,
                    'Invalid Record Type Id ' + weid.WEAccId__c
                    );
                }
            } */

          List<Entitlement> entitlements = new List<Entitlement>();
          for (Account newAccount: Trigger.New) {

             
               Entitlement newEnt = new Entitlement();
               newEnt.Name = 'Submit Application';
               newEnt.AccountId = newAccount.Id;
               newEnt.StartDate = Date.Today();
               newEnt.EndDate = Date.Today().addYears(50);
              // newEnt.BusinessHoursId = '01m7000000008Ke';
              // newEnt.SlaProcessId = '552M000000000XA';
               entitlements.add(newEnt);
             }
              insert entitlements;
        
          
        Map <Id,list<Entitlement>> mAccountEntitlements = new map<Id,list<Entitlement>>() ;
        for(Entitlement E : entitlements){
             mAccountEntitlements.put(E.AccountId,new list<Entitlement>());
             mAccountEntitlements.get(E.AccountId).add(E);
        }       
        
        list<account> laccount = new list<account>();
        for( Account A : Trigger.New ) {
            A.Entitlement_ID__c  = mAccountEntitlements.get(A.Id)[0].Id; 
          }
    
        update laccount;
    }     
}