public with sharing class AccountController1 {
private Id accountId = null;
private Account accountObj = null;

public AccountController1() {
accountId = ApexPages.currentPage().getParameters().get('id');
accountObj = (accountId == null) ? new Account() : [SELECT name, accountnumber, industry, billingstreet FROM account WHERE Id = :accountId];
}

public Account getAccountObj() {
if (accountObj != null) {
return accountObj;
}
return null;
}
public PageReference save() {
try {
upsert(accountObj);
} catch(System.DMLException e) {
ApexPages.addMessages(e);
return null;
}
PageReference page = new PageReference('/apex/ContactViewPage?Id=' + accountId);
return page;
}
public PageReference cancel() {
PageReference page = new PageReference('/apex/AccountViewPage?id=' + accountId);
return page;
}
}