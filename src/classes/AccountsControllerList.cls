public class AccountsControllerList {
  @AuraEnabled
  public static List<Account> getAccounts() {
    return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone,SampleTextField__c,SampleCheckBox__c
    FROM Account ORDER BY createdDate ASC Limit 5];
  }
}