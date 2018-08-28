@isTest
Public Class TestUniquerecord {
   @isTest
   static void createAccount(){
       Account Acc = new Account(name = 'TestFile', Unique_Text_Field__c = 'Ankit');
       insert Acc;
       system.debug('----' + acc);
   }

}