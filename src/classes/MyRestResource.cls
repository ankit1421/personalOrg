@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {
@HttpPost
    global static String doPost(String name,
        String AccId) {
        
        Account acc=[Select id,Name from Account where Id=:AccId];
        acc.Name=name;
        update acc;
       
       return acc.name; 
    }
}