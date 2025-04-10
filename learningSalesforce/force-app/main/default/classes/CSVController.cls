public with sharing class CSVController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [Select Id,Name,Phone,AnnualRevenue,Industry from Account];
    }
}