trigger testProfile on Contact (before update, before insert, after insert, after update) {
      Id Ids ;
      for( Contact C :Trigger.New){
             Ids = C.AccountId;
           break;
      }
      Account acc = [select name from account where Id =: Ids];
      acc.Name = 'Test Name';
      update acc;
}