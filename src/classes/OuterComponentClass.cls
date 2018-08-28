public class OuterComponentClass {

   @AuraEnabled
   public static Account getAccName (){
       return [select Id,Name from Account limit 1];
    }

   @AuraEnabled
   public static sampleReturnClass getClassInstance (){
       sampleReturnClass sm = new sampleReturnClass();
       sm.sName = 'What the fuck';
       return sm;
    }

}