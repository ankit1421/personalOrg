// All test methods in this class can access all data.
@isTest(SeeAllData=true)
public class TestDataAccessClass {

    // This test accesses an existing account. 
    // It also creates and accesses a new test account.
    static testmethod void myTestMethod1() {
        // Query an existing account in the organization. 
        Account a = [SELECT Id, Name FROM Account WHERE Name='Acme' LIMIT 1];
        a.Name = 'Acme Test';
        update a;
        system.debug('----' + a);
        System.assert(a != null);
       
    }
       
   
  
}