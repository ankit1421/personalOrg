/***  
   This is a Utility class used for converting the Contact into new Lead.
   The methods from this class are used in 2 scenarios:
    1. Whenever the Account is changed on Contact record
    2. When the UnConvert custom button on the Contact detail page is clicked.
*/

public class ContactHandler{
    
    public static final String subject = 'Contact Role Deleted.';
    public static final String description = 'Your Opporunity`s assosiated one of the contact role is deleted.';
    public static final String disaplyName = 'Admin Notification';
    
    /*
    * Convert the Contact to Lead by mapping necessary fields from Contact records.
    * To create a new Lead successfully.. Company Name field on the Lead object is mandatory, and
    * the value of this field comes from the AccountName field. Error Message is shown on the page
    * when Account is missing on the Contact record.
    */
    public static String convertContactToLead(Set<Id> accountIdSet, List<Contact> changedContactSet){
        
        
        String err = '';
        String companyName = '';
        Integer numberOfEmployees;
        List<Lead> convertedLeads = new List<Lead>();
        Map<Id, Account> accountFields;
        
        try{
        if(!accountIdSet.isEmpty()){
            //get the Account.Name from these Ids.
            accountFields = new Map<Id, Account>(
                            [SELECT Id, Name, NumberOfEmployees FROM Account WHERE Id IN :accountIdSet]);
        }    
            
        for(Contact c : changedContactSet){
                
            if(!accountIdSet.isEmpty()){
                companyName = accountFields.get(c.AccountId).Name;
                numberOfEmployees = accountFields.get(c.AccountId).NumberOfEmployees;
            }
                
            if(companyName == null || companyName == ''){
                throw new CustomException('Account is required on Contact as Account Name'+
                + ' is used as Company Name to create new Lead.'); 
            }
                        
            convertedLeads.add(new Lead(
                
                //-----Compound Address fields--------
                Street = c.MailingStreet,
                City = c.MailingCity,
                State = c.MailingState,
                Country = c.MailingCountry,
                PostalCode = c.MailingPostalCode,
                //-----Compound Address fields--------
                        
                //Lead company Name is set to AccountName.
                Company = companyName,
                Description = c.Description,
                DoNotCall = c.DoNotCall,
                Email = c.Email,
                HasOptedOutOfEmail = c.HasOptedOutOfEmail,
                Fax = c.Fax,
                HasOptedOutOfFax = c.HasOptedOutOfFax,
                FirstName = c.FirstName,
                LastName = c.LastName,
                OwnerId = c.OwnerId,
                LeadSource = c.LeadSource,
                MobilePhone = c.MobilePhone,
                        
                //Number of Employees is set from the Account's Number of Employees.
                NumberOfEmployees = numberOfEmployees,
                        
                Phone = c.Phone,
                Title = c.Title       
            )); 
        }
        

        if(convertedLeads.size()>0){
            insert convertedLeads;
            if(Trigger.isExecuting)
                deleteContactFuture(JSON.serialize(changedContactSet));
            else
                deleteContact(JSON.serialize(changedContactSet));   
        }
        
        }Catch(Exception e){
            err = e.getMessage();
            System.debug('ErrMsg*** '+ err );
            return err;
        }
        
        return err;
    }
    
    /*
    * The future callDeleteContactFrmTrigger(...) is invoked in a Trigger context.
    */
    @future
    public static void deleteContactFuture(String serializedContactList){
        // Being its future method handling error`s and sending email to sys admin.
        // Usually we capture error logs in error log object..
        String err = '';
        err = deleteContact(serializedContactList);
        if(err != '' && err != null ){
         // Send email incase error message..  
        List<User> usrs = new List<User>([SELECT Id, Email FROM User WHERE isActive = TRUE AND Profile.Name = 'System Administrator']);
        List<String> emailIds = new List<String>();
        for(User u : usrs){emailIds.add(u.Email);}  
        sendNotification('Error Occured in future method', err, emailIds, disaplyName);
        }
        
    }
    
    /*
    * deleteContact(..) is called when custom button is clicked on the Contact detail page.
    */
    public static String deleteContact(String serializedContactList){
        String err = '';
        try{
        List<Contact> deleteContacts = (List<Contact>)JSON.deserialize(serializedContactList, List<Contact>.class);
        delete deleteContacts;
        
        }Catch(Exception e){
            err = e.getMessage();
            return err;
        }
        
        return err;
    }
    
    /*
    * deleteAssociatedContactRoles(...) deletes ContactRoles associated with the Opportunity.
    */
    public static String deleteAssociatedContactRoles(Set<Id> oldAccountIdSet, List<Contact> changedContactSet){
       
        String err = '';
        try{
        List<String> emailStr = new List<String>();
        List<OpportunityContactRole> oppContactRoles = new List<OpportunityContactRole>();
       
        oppContactRoles = [SELECT Id, Role, Opportunity.OwnerId, Opportunity.Owner.Email, Opportunity.Account.OwnerId FROM OpportunityContactRole WHERE 
                               Opportunity.IsClosed = FALSE AND 
                               Opportunity.AccountId IN: oldAccountIdSet AND
                               ContactId IN: changedContactSet];
        
        // Delete the OpportunityContactRoles associated to the Contact.
        if(!oppContactRoles.isEmpty()){
            delete(oppContactRoles);
        }
        
        //Email Notification part incase Account and opportunity Owner are different.
        for(OpportunityContactRole ocr : oppContactRoles ){
         if(ocr.Opportunity.OwnerId != UserInfo.getUserId())
             emailStr.add(ocr.Opportunity.Owner.Email);
        }
        
        if(!emailStr.isEmpty()){
            sendNotification(subject, description, emailStr, disaplyName);
        }
         
        }Catch(Exception e){
         err = e.getMessage();
         return err;
        }
    return err;
    }
    
    /*
     *Email Notification method.
     */
    public static void sendNotification(String eSubject, String eDescription, List<String> email, String senderDisplayName) {
    
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       mail.setToAddresses(email);
       mail.setSenderDisplayName(senderDisplayName);
       mail.setSubject(subject);
       mail.setHtmlBody(description.replace('\r\n','<br/>'));
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
      
   }
}