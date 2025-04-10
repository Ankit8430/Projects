public class ContactCalculationOnAccount {
	@future
    public static void countContact(List<Id>accIds){
        List<Account>updateAccounts=[Select Id,(Select Id from Contacts) from Account where Id=:accIds];
        for(Account acc:updateAccounts){
            acc.Total_Contact__c=acc.Contacts.size(); 
            System.debug('Id =:'+acc.id+' Contact '+acc.Contacts.size());
        }
        if(!updateAccounts.isEmpty()){
            update updateAccounts;
        }
    }
}