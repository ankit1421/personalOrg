@IsTest
private class TestVerifyDate {

   @isTest static void testDate(){
        VerifyDate.CheckDates(Date.newInstance(2016,05,06),Date.newInstance(2016,03,30));
        VerifyDate.CheckDates(Date.newInstance(2016,05,06),Date.newInstance(2016,05,30));
   } 

}