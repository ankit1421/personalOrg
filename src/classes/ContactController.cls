public with sharing class ContactController {
    
    private Id accountId = null;
    private List<Contact> contacts = null;
    private Account accountObj = null;

    /*
    public ContactController() {
        accountId = ApexPages.currentPage().getParameters().get('id');
    }
    */

    public ContactController(AccountController accountController) {
        accountId = accountController.getAccountObj().Id;
        accountObj = accountController.getAccountObj();
    }

    public List<Contact> getContacts() {
                
        if (accountId != null) {
            contacts = [SELECT  Id, Name, Phone FROM Contact WHERE AccountId = :accountId ORDER BY lastmodifieddate desc];          
        }
        return contacts;    
    }
    
    public Account getAccountObj() {
        if (accountObj != null) {
            return accountObj;
        }
        return null;
    }
}