@isTEst
public class AccountTriggerHandlerTest {
	@isTEst
    private static void testMethod1(){
        List<Account>accList=new List<Account>();
        for(Integer i=0;i<=10;i++){
            accList.add(new Account(Name='Test'+i,Industry='Technology'));
        }
        Test.startTest();
        Database.SaveResult[] srList=Database.insert(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Errors =:'+sr.getErrors()[0].getMessage());
        }
        Test.stopTest();
    }
}