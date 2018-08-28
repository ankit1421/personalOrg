global with sharing class scheduledinvoices implements Schedulable{


global void execute(SchedulableContext SC) {
    sendTestEmail STE = new sendTestEmail ();
    STE.sendemail();
 }
}