public class CustomExp {

    public PageReference insertAccount() {
        try {
             insert new Account (name = '111');
        }
        Catch (Exception E){
             ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Le Saale Le'));
        } 
       return null; 
    }

}