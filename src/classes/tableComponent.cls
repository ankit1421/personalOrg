public class tableComponent  {

  @AuraEnabled
  public static List<Account> findAccounts(){
    return [select Id,Name,billingCountry from Account limit 15];
  }

}