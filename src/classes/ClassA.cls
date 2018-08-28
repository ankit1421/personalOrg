public class ClassA {

    public ClassA(ApexPages.StandardController controller) {
        system.debug('Current page ---' + apexpages.currentPage().getHeaders());    
    }


   public Account acc {get;set;}
     
    public classA (){
       b b1 = new b();
       b1.printb(acc);
    }
    
    public void phonenum (){
        acc.phone = '12321321';
    }
    
    public void getprint(){
     system.debug('--getPrint--');
     b b1 = new b();
     b1.printb(acc);
    }
    
    
    
}