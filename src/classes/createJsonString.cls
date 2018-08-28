public class createJsonString {
   
    public Customer c;
   public createJsonString (string Name,string mon,string product,integer money){
            c = new customer(Name,mon,product,money);
   
   }
   
   
   public class customer {
     public string Name;
     public String Mon;
     public String Product;
     public integer Money ;
   
     public customer (string Name,string mon,string product,integer money){
            this.name = Name;
            this.Mon = Mon;
            this.Product = Product;
            this.Money = Money ;
      }
   
   }



}