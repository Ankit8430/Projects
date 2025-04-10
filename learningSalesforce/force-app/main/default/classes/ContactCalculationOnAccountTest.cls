@isTest
public class ContactCalculationOnAccountTest {
	@isTest
    private static void countContactTest(){
        List<Account>accList=new List<Account>();
        List<Contact>conList=new List<Contact>();
        for(Integer i=0;i<5;i++){
            accList.add(new Account(Name='Test'+i));
        }
        if(!accList.isEmpty()){
            Database.SaveResult[] srList=Database.insert(accList,false);
            for(Database.SaveResult sr:srList){
                if(sr.isSuccess()){
                    System.debug('Id =: '+sr.getId());
                }else{
                    System.debug(LoggingLevel.info,'Error =: '+sr.getErrors()[0].getMessage());
                }
            }
        }
        for(Account acc:accList){
            conList.add(new Contact(LastName=acc.Name,AccountId=acc.id));
        }
        if(!conList.isEmpty()){
            Database.SaveResult[] srList=Database.insert(conList,false);
            for(Database.SaveResult sr:srList){
                if(sr.isSuccess()){
                    System.debug('Id =:'+sr.getId());
                }else{
                    system.debug(LoggingLevel.info,'Error=: '+sr.getErrors()[0].getMessage());
                }
            }
        }
        List<Id>accIds=new List<Id>();
        for(Account acc:accList){
            accIds.add(acc.id);
        }
        Test.startTest();
        ContactCalculationOnAccount.countContact(accIds);
        Test.stopTest();
        List<Account>updateAccounts=[Select Id,Total_Contact__c from Account where Id=:accIds];
        System.assertEquals(1,updateAccounts[0].Total_Contact__c);
    }
}