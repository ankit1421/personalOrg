public class fetchtestdata {
   public list <account> acc_lst {get{
     return([select name from account limit 10]);
   }
   
   set;}

}