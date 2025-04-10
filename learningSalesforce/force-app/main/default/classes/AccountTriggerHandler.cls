public class AccountTriggerHandler {
	@Future
    public static void updateAccountPhone(Set<Id>accIds){
        List<Account>accList=[Select Id,Phone from Account where Id IN:accIds and Industry='Technology'];
        for(Account acc:accList){
            acc.Phone='8430306246';
        }
        Database.SaveResult[] srList=Database.update(accList,false);
        for(Database.SaveREsult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
    }
}