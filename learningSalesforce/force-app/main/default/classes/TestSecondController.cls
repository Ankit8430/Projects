public with sharing class TestSecondController {
	@AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<account>accList=[Select Id,Name,AnnualRevenue,Industry from Account limit 10];
        return accList;
    }
}