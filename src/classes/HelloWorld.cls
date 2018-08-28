@RestResource(urlMapping='/TestREST/')
global with sharing class HelloWorld {
        @HttpGet
        global static string sayHelloWorld() {
                return 'Hello';
        }
}