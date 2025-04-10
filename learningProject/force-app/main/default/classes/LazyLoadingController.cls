public with sharing class LazyLoadingController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecords(){
        return [Select Id,Name,Industry,Rating from Account order by Name,Id Limit 100];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecordOnLoadMore(String lastId){
        return[Select Id,Name,Industry,Rating from Account where Id>:lastId Order By Name,Id Limit 100];
    }
}