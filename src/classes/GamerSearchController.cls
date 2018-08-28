public with sharing class GamerSearchController 
{
    public String caseNum {get; set;}
    public String phoneNum {get; set;}
    public String email {get; set;}
    public string country {get;set;} 
    Boolean bool = false;
    String ErrMsg;
    string Formatted_phn_number;
    public Boolean resultsTable {get;set;}
    public Id conId;
    public String qryStr = '';
    
    public List<selectoption> getCountry_list()
    {
        List <selectOption> options = new list <SelectOption> ();
        options.add(new SelectOption('USA','USA'));
        options.add(new SelectOption('Other','Other'));
        return options;   
    }
    
    
    public GamerSearchController()
    {
        cons = new ApexPages.StandardSetController(Database.getQueryLocator([Select Name, Phone, Email from Contact limit 0])); 
        resultsTable = False;
    }
    
    public Boolean ValidateEmailAddress (String email_val)
       {
            string at= '@';
            string dot= '.';
            String email_val_trim = email_val.trim();
            Integer lat = email_val_trim.indexOf(at);
            Integer lstr = email_val_trim.length();
            Integer ldot = email_val_trim.indexOf(dot);
            
            if (email_val_trim.indexOf(at)== -1){
               System.debug('check Email 1');
               return false;
            }
    
            if (email_val_trim.indexOf(at)== -1 || email_val_trim.indexOf(at)==0 || email_val_trim.indexOf(at)==lstr){
               System.debug('check Email 2' );
               return false;
            }
    
            if (email_val_trim.indexOf(dot)== -1 || email_val_trim.indexOf(dot)==0 || email_val_trim.indexOf(dot)==lstr){
                System.debug('check Email 3');
                return false;
            }
    
            if (email_val_trim.indexOf(at,(lat+1))!= -1){
               System.debug('check Email 4');
                return false;
             }
    
             if (email_val_trim.substring(lat-1,lat)== dot || email_val_trim.substring(lat+1,lat+2)== dot){
                 System.debug('check Email  5');
                 return false;
             }
    
             if (email_val_trim.indexOf(dot,(lat+2))== -1){
              System.debug('check Email 6'); 
               return false;
             }
            
             if (email_val_trim.indexOf('')!= -1 && email_val_trim.indexOf('')!= 0 ){
                
                System.debug('check Email 7'+ email_val_trim.indexOf(''));
                return false;
             }
    
             return true;                   
        }
        
    public boolean CheckValid(){
     
     // Setting Boolean as a False
     bool = false;
     system.debug('********caseNum*********' + caseNum);
     system.debug('********phoneNum*********' + phoneNum);
     system.debug('********email*********' + email);
     if (caseNum == '' && phoneNum == '' && email == ''){     
         ErrMsg = 'Please provide search Criteria';
         bool = true;  
        }
        
     else if (phoneNum != '')
       {
          if (country == 'USA'){
          Pattern PhoneFormat = Pattern.Compile('^[0-9]{10}');  
          matcher Matchphone = PhoneFormat.matcher(phoneNum);
          System.debug('&&&&&&&&&&&&&' + MatchPhone.Matches());
          bool = !Matchphone.matches();
          ErrMsg = 'Please provide 10 digit valid phone number';
          }
        else{
            bool = phoneNum.Contains('.');
            try
                {
                    long dlbVal=long.valueOf(phoneNum );
                }
                catch(Exception e)
                {
                    bool=true;
                }
           }
        }
        
     else if (email != '')
     {
         system.debug(('Mail id evaluate'+ ValidateEmailAddress(email)));
         bool = !(ValidateEmailAddress(email)); 
         ErrMsg = 'Please provide valid E-mail Id';
         system.debug('@@@@@@@@@@@'+ bool);
     }
            
            return bool;
    }
    
    
    public PageReference searchClick()
    {      
            if (checkValid())
            {
               ApexPages.addMessage (new ApexPages.Message (ApexPages.Severity.ERROR,ErrMsg));
            }            
        else{
                system.debug('making the value'+ resultsTable);
                resultsTable = True;
                system.debug('Value of the boolean'+ resultsTable);
                qryStr = 'Select Name, Phone, Email from Contact';
                Integer tempInt = qryStr.length();
                
                if(caseNum != null && caseNum != '')
                {
                    try{
                      conId = [Select Contact.Id from Case where CaseNumber =: caseNum].Contact.Id;
                      qryStr += ' where Id = \'' + conId + '\'';
                   }
                  catch(Exception ex) {
                        ApexPages.addMessage (new ApexPages.Message (ApexPages.Severity.ERROR,'No record found for the search'));
                    }
                }
                
                if(phoneNum != null && phoneNum != '' )
                {
                    
                    if (country =='USA')
                    Formatted_phn_number = '(' + phoneNum.substring(0,3)+') '+ phoneNum.substring(3,6)+'-'+phoneNum.substring(6,10);
                    else
                    Formatted_phn_number = '%'+phoneNum+'%';
                    system.debug('Formated Phone Number' + Formatted_phn_number);
                    if(tempInt < qryStr.length())
                        qryStr += ' and Phone Like \'' +Formatted_phn_number + '\'';
                    else qryStr += ' where Phone Like \'' +Formatted_phn_number + '\'';
                }
                
                if(email != null && email != '')
                {
                    if(tempInt < qryStr.length())
                        qryStr += ' and Email = \'' + email + '\'';
                    else qryStr += ' where Email = \'' + email + '\'';
                }
                
                try
                {
                    System.debug('Query String....' + qryStr);
                    cons = new ApexPages.StandardSetController(Database.getQueryLocator(qryStr));            
                    cons.setPageSize(10);
                }
                catch(Exception ex)
                {
                    system.debug('In the catch'+ ex);
                    ApexPages.addmessages(ex);
                }
            }    
               
                system.debug('Value of the boolean in the end'+ resultsTable);
                return null;
    }
    
    
    public ApexPages.StandardSetController cons
    {
        get
        {
            return cons;
        }
        set;
    }
    
    public List<Contact> getContacts()
    {
        return (List<Contact>) cons.getRecords();
    }
    
    public Integer pages
    {
        get
        {
            pages = cons.getResultSize()/cons.getPageSize();
            return pages;
        }
        set;
    }
    
    public Boolean hasNext
    {
        get
        {
            return cons.getHasNext();
        }
        set;
    }
    
    public Boolean hasPrevious
    {
        get
        {
            return cons.getHasPrevious();
        }
        set;
    }
    
    public Integer pageNumber
    {
        get
        {
            return cons.getPageNumber();
        }
        set;
    }
    
    public void first()
    {
        cons.first();
    }
    
    public void last()
    {
        cons.last();
    }
    
    public PageReference previous()
    {
        Integer p = cons.getPageNumber();
        if(hasPrevious)
        {
            cons.setPageNumber(p-1);
        }
        return null;
    }
    
    public PageReference next()
    {
        Integer p = cons.getPageNumber();
        if(hasNext)
        {
            cons.setPageNumber(p+1);
        }
        return null;
    }
    
    public void cancel()
    {
        cons.cancel();
    }
}