public with sharing class updatecontactemail {

    contact con;
    public updatecontactemail(ApexPages.StandardController controller) {
        con = (Contact)controller.getRecord();
        system.debug('updated contact' + con);    
    }

}