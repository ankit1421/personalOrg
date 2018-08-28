public class RandomContactFactory {

   public static List<contact> generateRandomContacts(Integer noOfContacts,String lastName){
         List<contact> lstCon = new list<contact> ();
         for(integer i=0;i<noOfcontacts;i++){
             Contact con = new Contact(firstName = 'Contact' + i,lastName = lastName);
             lstCon.add(con);
         }
        return lstCon;
   }



}