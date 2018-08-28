trigger createandupdateTask on Account (after delete, after update,after insert) {
if(trigger.size>0){
      List<Account> chkAcc = New List<Account>(); //initial list
      List<Account> finalacc = New List<Account>(); //final list to query
      List<Account> finaltaskCreate = New List<Account>(); //Final List to Account For Which Need To Create Tasks And Not Update
      List<Task> UpdateTaskList = new List<Task>();
      List<Task> InsertTaskList = new List<Task>();
      Set<Id> accIds = new Set<Id>();
      chkAcc = trigger.new;
      for(Account tempacc : chkAcc){
            if(tempacc.BillingCity == 'gurgaon'){ //Entry Criteria
                  finalacc.add(tempacc);
                  accIds.add(tempacc.Id);
            }    
      } //Looping Ends to Check for Entry Criteria
      if(finalacc.size()>0){//Get into this loop only if you have Account to create & Update tasks for
            List<Task> querytask = new List<Task>();
            querytask = [select Id, WhatId from Task where Subject = 'Call' and whatId in : accIds];
            if(querytask.Size()>0) {
                  Map<Id, Task> AccTaskMap = new Map<Id, Task>();
                  for(Task tempTask : querytask)
                        AccTaskMap.put(tempTask.whatId, tempTask);           
                  for(Account tempacc : finalacc){
                        if(AccTaskMap.containsKey(tempacc.Id)){ //Update Task Candidate
                              Task UpdateTask = AccTaskMap.get(tempacc.Id);
                              UpdateTask.Description = 'Updated Task';
                              UpdateTaskList.add(UpdateTask);
                        }
                        else{//Add Accounts Which did not have a task already
                              finaltaskCreate.add(tempacc);
                        }
                  }
            }
            else{
                  //no records were returned create new tasks for all accounts
                  finaltaskCreate = finalacc;
            }
      }
     
      if(UpdateTaskList.size()>0)
            update UpdateTaskList; //update task
     
      if(finaltaskCreate.size()>0){//Start Creating Tasks and Adding to List
            for(Account tempAcc : finaltaskCreate){
                  Task tempTask = new Task();
                        tempTask.WhatId = tempacc.Id;
                        tempTask.OwnerId = tempacc.OwnerId;
                        tempTask.Status = 'Not Started';
                        tempTask.subject = 'Call';
                        tempTask.Priority = 'Normal';
                        tempTask.Description = 'WOW I Just Created A TASK!!!';
                        InsertTaskList.add(tempTask);
            }
      }
      if(InsertTaskList.size()>0)
            insert InsertTaskList; //insert the list 
}
}