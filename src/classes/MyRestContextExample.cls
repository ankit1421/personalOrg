@RestResource(urlMapping='/MyRestContextExample/*')
global with sharing class MyRestContextExample {

    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        system.debug('##################' +req);
        system.debug('_____________________'+res);
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
  
}