@isTest

private class TestRestrictContactByName{
 
   @isTest static void testContactTrigger(){
           
        List<Contact> Con = new List<Contact> ();
        Con.add(new Contact(FirstName = 'Ankit',LastName = 'Khandelwal'));
        Con.add(new Contact(FirstName = 'Vicky',LastName = 'INVALIDNAME'));
        Test.StartTest();   
         Insert Con;  
        Test.StopTest();
     }


}