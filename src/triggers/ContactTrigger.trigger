/*
*When a contact leaves a company, convert that contact back to a lead.
*/

trigger ContactTrigger on Contact (after update) {
    
    //Set<Id> accountIdSet = new Set<Id>();
    String errMsg = '';
    List<Contact> changedContactSet = new List<Contact>();
    List<Contact> newContactSet = new List<Contact>();
    Set<Id> oldAccountIdSet = new Set<Id>();
    
    try{
    for(Contact newContact: trigger.New){
        if(trigger.oldMap.get(newContact.Id).AccountId != null && 
                    newContact.AccountId != trigger.oldMap.get(newContact.Id).AccountId){
            
            //accountIdSet.add(newContact.AccountId);
            changedContactSet.add(trigger.oldMap.get(newContact.Id));
            newContactSet.add(newContact);
            oldAccountIdSet.add(trigger.oldMap.get(newContact.Id).AccountId);
        }
    }
    //1.Delete any contact roles associated with open opportunities for the contact with the old account
    errMsg = ContactHandler.deleteAssociatedContactRoles(oldAccountIdSet, changedContactSet);
    
    if(!oldAccountIdSet.isEmpty() && (errMsg ==null || errMsg == '')){
        //2.  convert the contact to Lead
      errMsg  = ContactHandler.convertContactToLead(oldAccountIdSet, changedContactSet);
    }  
    
    if(errMsg != '' && errMsg != null){
     throw new CustomException(errMsg);
    }
    
    }Catch(Exception e){
    
    }  
}