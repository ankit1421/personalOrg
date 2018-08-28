@isTest
private class test_class

{
  static testMethod void myUnitTest()
  
  {
       Account tempacc = new account();
       tempacc.name = 'xyz';
       tempacc.BillingCity = 'gurgaon';
       tempacc.billingStreet = 'gurgaon';
       insert tempacc;
       
       tempacc.billingCity = 'gurgaon';
       update tempacc;
  }
}