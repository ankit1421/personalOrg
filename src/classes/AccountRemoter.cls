global with sharing class AccountRemoter {
  public string accountName {get;set;}
  public static Account acc {get;set;}
  public AccountRemoter (){
        
  
  }

  @RemoteAction
  global static Account getAccount ( string accountName){
          acc = [select id,Name,NumberOfEmployees  from account where name =: accountname limit 1];
         return acc;
  }

}