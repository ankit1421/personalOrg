global class accountsWithGoogleMap {
   @RemoteAction
    global static List<Account> getAccounts (String accName, String state) {
     accName = '%' + accName + '%';
     return [select Id,Name,billingstreet,billingcity,billingstate,billingcountry
             from Account where Name Like : accName OR billingState =:state]; 
    }     
}