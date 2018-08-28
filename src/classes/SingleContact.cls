public class SingleContact {
    @AuraEnabled
    public Static List<Contact> getContact(){
        return [select Id,Name,Profile_Pic__c,Profile_Pic_URL__c,MailingStreet,MailingCity,
               MailingState,MailingCountry,MailingPostalCode from Contact Limit 10];
    }
}