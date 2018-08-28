public class MyContactListController {
   @AuraEnabled 
     public static list<Contact> getContacts(){
        return [select Id,Name,Email,Title,phone from Contact limit 5];
    }
}