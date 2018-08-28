public class ASACLASSPRE 
{
    //Object variables
    Opportunity opp = null;
    
    //Getter setters
    public string orderType{get;set;}
    public string origincode{get;set;}
    public string orderNo{get;set;}
    public string salesTMID{get;set;}
    public string hierarchy{get;set;}
    public string BusiLegName{get;set;} 
    public string DBA {get;set;}
    public string LocId {get;set;}
    public string StrAdd {get;set;}
    public string sutApt {get;set;}
    public string city {get;set;}
    public string state {get;set;}
    public string zip {get;set;}
    public string zip4 {get;set;}
    public string Busitel {get;set;}
    public string Ext {get;set;}
    public string conname {get;set;}
    public string conemail {get;set;}
    public string cusserph {get;set;}
    public string stksym {get;set;}
    public string Fax {get;set;}
    public string Ext1 {get;set;}
    public string CpcInd {get;set;}
    public string webadd {get;set;}
    public string busiemail {get;set;}
    public string cusEmailSer {get;set;}
    public boolean issersite {get;set;}
    public boolean payment {get;set;}
    public boolean correspondence {get;set;}
    public boolean homebased {get;set;}
    
    
    
         

    
    //Constructor
    public ASACLASSPRE ()
    {
        //opp = [SELECT id, name,corporate_LIF__c,Check_Corp_LIF__c,Impacted_Location__c FROM Opportunity WHERE id = :ApexPages.currentPage().getParameters().get('oppid')];
    }
    
   /* public Decimal getCounter()
    {
        decimal i=opp.Check_Corp_LIF__c;
        return i;
    }*/
    
    public List<SelectOption> getOrderType1() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('','-- NONE --'));
            options.add(new SelectOption('New Account Setup','New Account Setup'));
            return options;
        }

        public List<SelectOption> getOrigincode1() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('','-- NONE --'));
            options.add(new SelectOption('LTT7 - Load Test 779879879898','LTT7 - Load Test 779879879898'));
            options.add(new SelectOption('0002 - FDMS First Data Merchant Services','0002 - FDMS First Data Merchant Services'));
            options.add(new SelectOption('0014 - American Bankcard (FDMS Report Only)','0014 - American Bankcard (FDMS Report Only)'));
            options.add(new SelectOption('0024 - FDMS Hawaii (Report Only)','0024 - FDMS Hawaii (Report Only)'));
            options.add(new SelectOption('0025 - Cape Code B & T Co (FDMS Reporting Only)','0025 - Cape Code B & T Co (FDMS Reporting Only)'));
            options.add(new SelectOption('0046 - EFS National Bank','0046 - EFS National Bank'));
            options.add(new SelectOption('0165 - Sams - FDMS Telesales (Report Only)','0165 - Sams - FDMS Telesales (Report Only)'));
            options.add(new SelectOption('0258 - FDMS Alliance Tlmktg (Reporting only)','0258 - FDMS Alliance Tlmktg (Reporting only)'));
            options.add(new SelectOption('0319 - FDMS FACS Omaha T','0319 - FDMS FACS Omaha T'));
            options.add(new SelectOption('0320 - FDMS Omaha (Report Only)','0320 - FDMS Omaha (Report Only)'));
            options.add(new SelectOption('0342 - FDMS Auto Approve JMA (Report Only)','0342 - FDMS Auto Approve JMA (Report Only)'));
            options.add(new SelectOption('0357 - FDMS Cross-Sell Team (Report Only)','0357 - FDMS Cross-Sell Team (Report Only)'));
            options.add(new SelectOption('0376 - FDMS Small Merchant (Report Only)','0376 - FDMS Small Merchant (Report Only)'));
            return options;
        }
        
        public List<SelectOption> gethier() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('','-- NONE --'));
            options.add(new SelectOption('CAP','CAP'));
            options.add(new SelectOption('COMPANY OWNED','COMPANY OWNED'));
            options.add(new SelectOption('COMPANY OWNED/FRANCHISE AFFILIATED','COMPANY OWNED/FRANCHISE AFFILIATED'));
            options.add(new SelectOption('FRANCHISE AFFILIATED','FRANCHISE AFFILIATED'));
            options.add(new SelectOption('SERVICE ESTABLISHMENT','SERVICE ESTABLISHMENT'));
            return options;
        }
                
       public List<SelectOption> getstat() 
       {
                List<SelectOption> options = new List<SelectOption>();
                options.add(new SelectOption('-- None --','-- NONE --'));
                options.add(new SelectOption('Alaska','Alaska'));
                options.add(new SelectOption('California','California'));
                options.add(new SelectOption('New Jersey','New Jersey   '));
                options.add(new SelectOption('Washington','Washington'));
                options.add(new SelectOption('South Carolina','South Carolina'));
                return options;
            }
       
       public List<selectoption> getcpind ()
       {
            List <selectOption> options = new list <SelectOption> ();
            options.add (new SelectOption('-- None --','-- NONE --'));
            options.add(new SelectOption('To Be Decided','To Be Decided'));
            return options;   
        }
     
     
    public string getbatchIdentifier()
        {
          double d = math.random();
          return (String.valueOf(d).substring(2,12));     
        }
     public string getIndcode ()
     {
       double x = math.random();
       return (String.valueof(x).substring(2,5)); 
     }   
    
  /* public pagereference submit()
    {
        double d = math.random();
        if(opp.Impacted_Location__c == null)
        {
            opp.Impacted_Location__c = String.valueOf(d).substring(2,12);    
        }
        else
        {
            opp.Impacted_Location__c = opp.Impacted_Location__c + ',' + String.valueOf(d).substring(2,12);
        }
        if(opp.Check_Corp_LIF__c == null)
        {
           opp.Check_Corp_LIF__c = 1;
        }
        else
        {
            opp.Check_Corp_LIF__c = opp.Check_Corp_LIF__c + 1;
        }
        update opp;
        
        Account_Setup_Automation__c asa = new Account_Setup_Automation__c();
        if(orderType !=null)
        asa.Order_Type_OI__c = orderType;
        
        if(origincode !=null)
        asa.Origin_Code_OI__c= origincode;
        
        asa.Batch_Identifier_OI__c= opp.Id;
        
        if(orderno!=null)
        asa.Order_Number_OI__c = orderno;
        
        if(salesTMID!=null)
        asa.Sales_Person_TMID_OI__c = salesTMID;
        
        if(hierarchy!=null)
        asa.Hierarchy_OI__c = hierarchy;
        
        insert asa;
        
        if(opp.Check_Corp_LIF__c == opp.corporate_LIF__c)
        {
            PageReference pageRef = new PageReference('/'+opp.Id);
            pageRef.setRedirect(true);
            return pageRef;
        }
        else
        {
            return null;
        }        
    }
        */

}