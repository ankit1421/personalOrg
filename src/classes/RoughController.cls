public class RoughController {
     public string sURL {
         set{
              system.debug('Set --- Set');
            }
         get{
           system.debug('Get---Get');
           system.debug('----' + sURL);
           system.debug('URL.getSalesforceBaseUrl()    ' + URL.getSalesforceBaseUrl());
           system.debug('URL.getSalesforceBaseUrl().getHost()' + URL.getSalesforceBaseUrl().getHost());
              if(sURL == Null)
                sURL = URL.getSalesforceBaseUrl().getHost() + 'salesforce.com' + '/servlet/servlet.FileDownload?file=';
           return sURL; 
           }
     }
   
    public RoughController (){
        system.debug ('Page Loaded'); 
    }
  }