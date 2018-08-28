public class sendTestEmail {
  pagereference pdf;

   public void sendemail (){
   
          
    pdf = Page.ReportsPage;
    Blob b= pdf.getContentAsPDF();
    Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    attach.setFileName('attachment.pdf'); // Set the file name here . . . 
    attach.setBody(b);
    string[] toaddress = new list <string> ();
    toaddress.add('khandelwalankit22@gmail.com');
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setUseSignature(false);
    mail.setToAddresses( toaddress );
    mail.setSubject('Your Statement');
    mail.setHtmlBody('Dear Customer,<br><br> Please find your statement attached in the email.');
    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
    // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
       }
       
   
   
   }