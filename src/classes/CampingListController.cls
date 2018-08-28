public class CampingListController {

  @AuraEnabled
  public static List<Camping_Item__c> getItems (){
          return [ select Id,packed__c,price__c,
                   Quantity__c from Camping_Item__c limit 10];
  }
   
  @AuraEnabled
  public static Camping_Item__c saveItem (Camping_Item__c newItem){
        system.debug('---newItem---' + newItem);
        insert newItem;
        return newItem;
    }
}