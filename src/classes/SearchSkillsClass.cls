public with sharing class SearchSkillsClass {

   public String SearchString{get;set;}
   public SearchRecords  SR_LST {get;set;}
   
   public class SearchRecords {
        public list<Lead> lead_lst{get;set;}
        public list<Account> acc_lst{get;set;}    
        
     }
  
    public String getResultsTable() {
        return null;
    }
   
   public SearchRecords  getSearch_lst() {
        return SR_LST;
    }


   
    public PageReference searchClick(){
      SR_LST  = new SearchRecords();
      SR_LST.acc_lst = database.query('Select id,Name,Technical_Skills__c from Account where Technical_Skills__c Like  \'%' + searchstring + '%\'');
      SR_LST.lead_lst= database.query('Select id,Name,Technical_Skills__c from lead where Technical_Skills__c Like  \'%' + searchstring + '%\'');
      return null;
    }
    

}