@isTest
public class UpdateParentAccountTest {
	@isTest
    private static void testMethod1(){
        Account acc=new Account(Name='Parent Account');
        insert acc;
        List<Account>accList=new List<account>();
        for(Integer i=0;i<=200;i++){
            accList.add(new Account(Name='Test'+i));
        }
        Database.SaveResult[] srList=Database.insert(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        Test.startTest();
        UpdateParentAccount up=new UpdateParentAccount(accList,acc.id);
        Id jobId=System.enqueueJob(up);
        System.debug('JobId =:'+jobId);
        Test.stopTest();
    }
}