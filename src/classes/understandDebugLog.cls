public class understandDebugLog {
   public string var1 {get{
     system.debug('I am inside set');
     return var1;
   }set;}
   
   public understandDebugLog(){
      system.debug('I am in constructor');
   }
}