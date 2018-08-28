/*
* Contact deletion upon Lead creation test.
*/
@isTest
private class UnConvertContactToLeadTest{

    @testSetup static void createTestData(){
        
        //Contact fields
        String firstName = 'FirstName';
        String lastName = 'LastName';
        String firstName2 = 'fn';
        String lastName2 = 'ln';
        String email = 'pathishravan@gmail.com';
        List<Contact> contactList = new List<Contact>();
        
        //Account fields
        String AccountName1 = 'Test Account1';
        String AccountName2 = 'Test Account2';
        
        //Opportunity fields
        String oppName = 'Test Opportunity';
        Date closeDate = System.Today();
        String stageName = 'Prospecting';
        String closedOppName = 'Closed Opportunity';
        String closedStageName = 'Closed Won';
        
        //OpportunityContactRole fields
        String role = 'Business User';
        List<OpportunityContactRole> contactRoleList = new List<OpportunityContactRole>();
        
        //Create a new Account named TestAccount1 and TestAccount2.
        Account oldAccount = new Account(Name=AccountName1);
        Account newAccount = new Account(Name=AccountName2);
        List<Account> accountList = new List<Account>();
        accountList.add(oldAccount);
        accountList.add(newAccount);
        insert accountList;
       
        
        //Create 100 Contact records with oldAccount.
        for(Integer i=0; i<202; i++){
            Contact contactWithAccount = new Contact(firstName = firstName + i, 
                lastName = lastName + i, email=email, AccountId = oldAccount.Id);
            contactList.add(contactWithAccount);    
        }
        insert contactList;
        
        //Create Contact record without AccountId.
        Contact contactWithoutAccount = new Contact(firstName=firstName, lastName=lastName, email=email);
        insert contactWithoutAccount;
        
        //Create an Open Opportunity associating the above Account.
        Opportunity opportunity = new Opportunity(Name=oppName, CloseDate=closeDate, StageName=stageName, AccountId = oldAccount.Id);
        insert opportunity;
        
        //Create a closed/won Opportunity associating the above Account.
        Opportunity closedOpportunity = new Opportunity(Name=closedOppName, CloseDate=closeDate, StageName=closedStageName, AccountId = oldAccount.Id);
        insert closedOpportunity;
        
        //Create 100 OpportunityContactRole records.
        for(Integer i=0; i<202; i++){
            OpportunityContactRole ocr = new OpportunityContactRole(ContactId = contactList[i].Id, 
                                                                    OpportunityId=opportunity.Id, Role=role);
            contactRoleList.add(ocr);    
        }
        
        insert contactRoleList;
    }
    
    static testMethod void testConvertContact2LeadWIthAccount(){
        
        //edit an existing Contact record to change the Account from oldAccount to newAccount.
        Test.startTest();
        List<Contact> contactWithAccount = new List<Contact>([SELECT Id, AccountId FROM Contact WHERE firstName NOT IN ('FirstName200', 'FirstName201', 'FirstName')]);
        System.assertEquals(200, contactWithAccount.size(), 'All Contact records');

        Account newAccount = [SELECT Id FROM Account WHERE Name =: 'Test Account2'];
        
        //System.assertNotEquals(newAccount.Id, contactWithAccount.AccountId, 'Old Account is not equals to new Account');
        
        for(Contact con : contactWithAccount){
        con.AccountId = newAccount.Id;
        }
        update contactWithAccount;
        Test.stopTest();
        
        //trigger validation:
        //1.  Check if the associated open Opportunity ContactRoles are deleted.
        Opportunity opportunity = [SELECT Id FROM Opportunity WHERE Name = 'Test Opportunity'];
        List<OpportunityContactRole> ocr = [SELECT Id FROM OpportunityContactRole WHERE 
                           OpportunityId=:opportunity.Id AND ContactId IN:contactWithAccount]; 
        System.assertEquals(0, ocr.size(), 'All the OpportunityContactRole are deleted Successfully');
        
        List<Contact> deletedContact = new List<Contact>([SELECT Id FROM Contact WHERE Id IN :contactWithAccount AND IsDeleted = true ALL ROWS]);
        System.assertEquals(200, deletedContact.size(), 'The Contact record got deleted');
        
        List<Lead> newLeads = new List<Lead>([SELECT Id FROM Lead WHERE Company = 'Test Account1']);
        System.assertEquals(200, newLeads.size(), '200 New Leads are created');
        
    }
    
   
    static testMethod void closedOpportunityTest(){
        
        Test.startTest();
        Contact contactWithAccount = [SELECT Id, AccountId FROM Contact WHERE firstName =: 'FirstName201' AND lastName =: 'LastName201' LIMIT 1];
        
        Opportunity opportunity = [SELECT Id FROM Opportunity WHERE Name = 'Closed Opportunity'];
        OpportunityContactRole contactRole = new OpportunityContactRole(ContactId = contactWithAccount.Id, 
                                                                    OpportunityId=opportunity.Id, Role='Business User');
        insert contactRole;                                                            
        
        Account newAccount = [SELECT Id FROM Account WHERE Name =: 'Test Account2'];
        contactWithAccount.AccountId = newAccount.Id;
        update contactWithAccount;
        
        Contact updatedCon = [SELECT Id, AccountId FROM Contact WHERE firstName =: 'FirstName201' AND lastName =: 'LastName201' LIMIT 1];
        
        Test.stopTest();
        
        System.assertNotEquals(updatedCon.Id, contactWithAccount.AccountId, 'Old Account is not equals to new Account');
        
        List<OpportunityContactRole> ocr = [SELECT Id FROM OpportunityContactRole WHERE 
                           OpportunityId =: opportunity.Id AND ContactId =: contactWithAccount.Id]; 
        System.assertEquals(1, ocr.size(), ' OpportunityContactRole is not deleted');
        
        Contact deletedContact = [SELECT Id, IsDeleted FROM Contact WHERE Id =:contactWithAccount.Id ALL ROWS];
        System.assertEquals(false, deletedContact.IsDeleted, 'The Contact record is not deleted');
        
    }
}