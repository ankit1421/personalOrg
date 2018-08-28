public class dataTableCon {
            
    List<Account> acc =  new  List<Account> ();
    List<Contact> con =  new  List<Contact> ();
    List<Opportunity> opp = new  List<opportunity> ();
    
    
    ID cid= ApexPages.currentPage().getParameters().get('Id');
         
        
 public List<Account> getAccounts() {
    try{
             acc = [SELECT a.Id, a.Name,(SELECT c.Id, c.firstname,c.lastname,c.name FROM a.Contacts c ),(SELECT op.Id, op.name FROM a.Opportunities op) 
                            FROM Account a where Id =:cid];
                            
            system.debug('*******************'+acc);
            if (acc.Size() > 0) 
            {
                for (Integer i = 0; i < acc.size(); i++) 
                {               
                    if (acc[i].contacts.Size() > 0) 
                    { 
                        for(integer j=0;j<acc[i].contacts.size();j++)
                        {
                              con.add(acc[i].contacts[j] );                             
                        }
                        
                        for(Integer k=0; k< acc[i].opportunities.size(); k++)
                        {
                          opp.add(acc[i].opportunities[k] );                                  
                        }  
                   }
              }
          }
    }
    catch (Exception ex) {
            system.debug('Failed, Error message:'+ ex.getMessage());
        } 
      return acc;
    }
    
    
    
    
  // method for return contacts list
  
  
  
   public List<Contact> getContacts() {
    return con;
   }
  
  // method for return opportunity list  
    
    public List<Opportunity> getOpportunities() {
    return opp;
   }
}