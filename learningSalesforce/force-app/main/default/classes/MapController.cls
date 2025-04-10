public with sharing class MapController {
    @AuraEnabled (cacheable=true)
    public static List<Account> getAccounts(){
        return [Select Id,Name, description,BillingStreet, BillingCountry,
         BillingCity, BillingState,
        BillingPostalCode from Account ORDER BY Name Limit 10];
    }
}