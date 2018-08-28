public class AwesomeProductControlller {
    
    @AuraEnabled
    public static List<product__c> getProducts (){
         return[select Id,Name,Description__c, 
                       points__c,photo__c from Product__c];
        
    }

    @AuraEnabled
    public static product__c getProductsByName(string Name){
        system.debug('====='+ name +'-----' + [select Id,Name,Description__c,points__c,photo__c,
               (select name from product_sizes__r order by name) from product__c where name =:name ]);  
        return[select Id,Name,Description__c,points__c,photo__c,
               (select name from product_sizes__r order by name) from product__c where name =:name ];
    }  
}