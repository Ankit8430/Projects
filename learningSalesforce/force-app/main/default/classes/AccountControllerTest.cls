@isTest
public class AccountControllerTest {
	@isTest
    private static void countContactTest(){
        List<Account>accList=new List<Account>();
        for(Integer i=0;i<=10;i++){
            accList.add(new Account(Name='Test'+i));
        }
        Database.SaveResult[] srList=Database.insert(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        List<Contact>conList=new List<Contact>();
        for(Account acc:accList){
            conList.add(new Contact(LastName='Test 1'+acc.Name,AccountId=acc.Id));
            conList.add(new Contact(LastName='Test 2'+acc.Name,AccountId=acc.Id));
        }
        srList=Database.insert(conList,false);
        for(database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        Set<Id>accIds=new Set<ID>();
        for(Account acc:accList){
            accIds.add(acc.id);
        }
        Test.StartTest();
        AccountController.countContact(accIds);
        Test.StopTest();
    }
}