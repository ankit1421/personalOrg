trigger AccountAddressTrigger on Account (before insert,before update) {
     if(Trigger.isBefore){
             for(Account A : Trigger.New){
                if(A.Match_Billing_Address__c){
                    A.ShippingPostalCode = A.BillingPostalCode;
                }
             
             }  
        }
}