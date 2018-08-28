public class SendEmailASA 
{
        
        // Define variables 
          
          List <string> toAddresses = new List<String>();
       // String subject = 'Test Mail for ASA';
          public String subject { get; set; }
          public Blob attach;
          string check_string = 'check1';
          List <string> get_value = new List<String>();
         
          
          
          public SendEmailASA()
          
          {
                 get_value.add('Get1');
                 get_value.add('Get2');
                 get_value.add('Get3');
                 get_value.add('Get4');
                 get_value.add('Get5');
                 get_value.add('Get6');
                 get_value.add('Get7');
                 get_value.add('Get8');
                 get_value.add('Get9');
          
          
          
          }
          string email_body = '<html><body>'+
                    ' Dear '+ User.LastName + '<br> Please find the SE Setup Report in the mail.</br>' +
                    '<TABLE BORDER="1" CELLSPACING="0" CELLPADDING="6">'+
                    '<TR><TH>SE number</TH> <TH>Order No</TH> <TH>Batch Identifier</TH><TH>Hierarchy</TH> <TH>Order Type</TH><TH>Sales Person TMID</TH><TH>Response</TH></TR>';
                    
                    string End_mail = '</TABLE> </body></html>';
        
        
        
        
    
        // function for sending the mail ; called from the ASA setup
         
         public PageReference  Sendmailtoasa()
             {
                 // adding mail address to the list 
                 toAddresses.add('khandelwalankit22@gmail.com');
                 
                 
                 
                 
                for (String i: get_value) 
                
                {
                 string email_column = '<TR><TD>'+i+'</TD><TD>'+'Column 2</TD><TD>Column 3</TD><TD>Column 4</TD><TD>Column 5</TD><TD>Column 6</TD><TD>Column 7</TD></TR>';
                 email_body = email_body + email_column ;
                }
               
               String email_failure = '<TABLE BORDER="1" CELLSPACING="0" CELLPADDING="6">'+
                    '<TR><TH>SE number</TH> <TH>Order No</TH> <TH>Batch Identifier</TH><TH>Hierarchy</TH> <TH>Order Type</TH><TH>Sales Person TMID</TH><TH>Response</TH></TR>';
               
               email_body = email_body + email_failure;
               
                for (String j: get_value) 
                
                {
                 string email_column_fail = '<TR><TD>'+j+'</TD><TD>'+'Column 2</TD><TD>Column 3</TD><TD>Column 4</TD><TD>Column 5</TD><TD>Column 6</TD><TD>Column 7</TD></TR>';
                 email_body = email_body + email_column_fail ;
                }
               email_body = email_body + End_mail;

                // Define object
                   Messaging.EmailFileAttachment file_attach = new Messaging.EmailFileAttachment();
                   Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
                 
                 // Sets the paramaters of the email 
                 email.setSubject( subject );
                 email.setToAddresses( toAddresses );
                 email.setHtmlBody(email_body);
                
               // Sets the paramaters of the email  
               
                 file_attach.setBody(attach);
                 file_attach.setFileName('attachment');
                 
                 
                 // Sends the email  
            
                 Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
                 return null;
               
               }
         

}