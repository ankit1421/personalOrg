/**
 * Created by Test User on 3/15/18.
 */

global class JavaScriptButton {

    @future(callout = true)
    webservice static void UpdateContact(){
       system.debug('method called');
        
        Http httpObj = new Http();

        HttpRequest reqObj = new HttpRequest();
        reqObj.setEndpoint('http://www.mocky.io/v2/5aab3ebb2e00005900138c65');
        reqObj.setMethod('GET');
        
        system.debug('---request----' + reqObj);
            
        HttpResponse resObj = new HttpResponse();
        resObj = httpObj.send(reqObj);
        system.debug('-------' + resObj.getBody());
    }

}