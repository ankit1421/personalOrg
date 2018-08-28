global without sharing class util
{
   // Get a list of picklist values from an existing object field.
   global static list<SelectOption> getPicklistValues(SObject obj, String fld)
   {
      list<SelectOption> options = new list<SelectOption>();
      // Get the object type of the SObject.
      Schema.sObjectType objType = obj.getSObjectType(); 
      // Describe the SObject using its object type.
      Schema.DescribeSObjectResult objDescribe = objType.getDescribe();       
      // Get a map of fields for the SObject
      map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap(); 
      // Get the list of picklist values for this field.
      list<Schema.PicklistEntry> values =
         fieldMap.get(fld).getDescribe().getPickListValues();
      // Add these values to the selectoption list.
      for (Schema.PicklistEntry a : values)
      { 
         options.add(new SelectOption(a.getLabel(), a.getValue())); 
      }
      return options;
   }

   private static testMethod void testVf()
   {
      // The standard Account object's standard Industry field is a picklist.
      // Required fields or validation rules on the Account object will cause
      // this to fail.
      list<SelectOption> testOptions = 
         getPicklistValues(new User(FirstName = 'Test'), 'EmailEncodingKey');
      system.assert(testOptions.size() > 0);
   }
}