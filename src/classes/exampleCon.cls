public class exampleCon {

    public String Inti { get{return string.valueof(5) ;} set; }
    Integer count = 0;
   // public Integer Inti = 5;        
    public PageReference incrementCounter() {
        count++;
        return null;
    }
            
    public Integer getCount() {
        return count;
    }
}