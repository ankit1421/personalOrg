public Class TestEmail {
 
    public static void SendEmailFunction(List<string> toaddress){
       try{
         Account acc = [select name from account Limit 1];
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         mail.setSubject('Test Email exception');
         mail.setToAddresses(toaddress);
         mail.setHtmlBody( '<html>' + acc.Name + '</html>');
         
         List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
            for(Messaging.SendEmailResult er : results) {
                  if(!er.isSuccess()) {
                      List<Messaging.SendEmailError> sees = er.getErrors();
                      for(Messaging.SendEmailError ser : sees) {
                          System.debug(ser.getFields() + ' - ' + ser.getMessage() + ' - ' + ser.getStatusCode());
                          break;
                      }
                  }
              }
       
       }catch(Exception E){
          system.debug('---' + E);
       }   
    
    }
}