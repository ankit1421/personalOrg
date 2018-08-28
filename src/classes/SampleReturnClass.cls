public with sharing class SampleReturnClass  {
    @AuraEnabled
    public string sName {
       get;
       set{
         sName = 'Ankit Khandelwal';
       }
    }

}