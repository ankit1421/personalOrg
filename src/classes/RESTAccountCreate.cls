@RestResource(urlMapping='/AnkitNavin/*')
global with sharing class RESTAccountCreate {

@HttpPost   
  global static void createNewCase(String Name ) {
     System.debug('COMPANY: '+Name);
     Account a = new Account ( name = Name );
     insert a;
  }
  
  }