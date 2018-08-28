trigger ThrowExp on Account (before insert,before update) {
     try{
          if (Trigger.New[0].Name == '111'){
              Integer I = 1/0;
          }
        }
       Catch (Exception E){
             Trigger.new[0].adderror(E);
             system.debug('---' + E);
           
       }  
}