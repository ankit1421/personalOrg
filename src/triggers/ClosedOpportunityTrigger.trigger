trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) {
    if(Trigger.isBefore){
          List<Task> Tk = new List<Task>();
          for(Opportunity O : Trigger.New){
              if(O.StageName == 'Closed Won'){
                   TK.add(new Task(Subject = 'Follow Up Test Task',whatId = O.Id));
              }
           }
           
          insert TK;    
     }
}