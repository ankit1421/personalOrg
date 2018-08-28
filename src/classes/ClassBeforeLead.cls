public with sharing class ClassBeforeLead {

    Public Lead temp_lead {get;set;}
    
    public ClassBeforeLead(ApexPages.StandardController controller) {
          temp_lead = new Lead ();
        
      }
    
    Public pagereference redirectStandardPage (){
      // Call CheckDuplicate Function here and pass the temp_Lead variable
        Pagereference newpage = new Pagereference ('/00Q/e?retURL=%2F00Q%2Fo');
        return newpage;
    }
}