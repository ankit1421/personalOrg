public class StaticFunctions {

/* public static void SetCountry ( List<SObject> oSObject, String strFieldName){
        
        system.debug('__________________'+ oSObject);
        List<User> lUsers = [Select Id,country From  User Where  Id=: UserInfo.getUserId() ];
        System.debug('_______________'+lusers.get(0).Country);
        List<Sobject> lstSobject;
         if(lUsers.size()>0){
             lstSobject = new List<Sobject> ();
             for (SObject S : oSObject) {
              s.put(strFieldName,lusers.get(0).Country);
              lstSobject.add(s); 
             }            
            try{
                Database.upsert(lstSobject);
            }         
            catch(Exception Ex){
              system.debug('Exception' + Ex);
            }
        }
    }    
    
  */
  
     public static PageReference redirect () {
        system.debug('-------get---------');
        PageReference acctPage = new PageReference('http://www.google.com');
        acctPage.setRedirect(true);
        return acctPage;
    }  
          
}