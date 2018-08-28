trigger CheckReadOnly on Account (after update) {
     List<Account> lacc = new list<Account> ();
     for (Account A : Trigger.new){
        Account Acc = new Account (Id = A.Id,Name = 'Read Only');
        lacc.add(Acc);
        break;  
     }
   update lacc;
}