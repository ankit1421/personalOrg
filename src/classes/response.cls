public class response {
   
   public InvoiceResponses res = new InvoiceResponses (); 
   
   public class InvoiceResponses {
      public list<invoiceresponse> listInvoiceResponse = new list<invoiceresponse> ();
   }
   
   public class invoiceresponse {
        string invoiceNumber;
        string status;
        string vendorNumber;
        string message;
    }
 
    public response (){
    
       invoiceResponse IR = new invoiceResponse ();
       IR.InvoiceNumber = '123456';
       IR.status = 'Sucess';
       IR.vendorNumber = '345678';
       IR.Message = '';
       
       invoiceResponse IR1 = new invoiceResponse ();
       IR1.InvoiceNumber = '123456';
       IR1.status = 'Failure';
       IR1.vendorNumber = '345678';
       IR1.Message = 'xyz exceptiom';
       
       res.listInvoiceResponse.add(IR);
       res.listInvoiceResponse.add(IR1); 
       
       
    }
}