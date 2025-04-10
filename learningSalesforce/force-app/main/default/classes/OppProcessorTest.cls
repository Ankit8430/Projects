@isTEst
public class OppProcessorTest {
	@isTEst
    private static void testMethod1(){
        List<Opportunity>oppList=new List<Opportunity>();
        for(Integer i=0;i<200;i++){
            oppList.add(new Opportunity(Name='Opp'+i,StageName='Qualification',CloseDate=system.today()));
        }
        Database.SaveResult[] srList=Database.insert(oppList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        Test.StartTest();
        OppProcessor batch=new OppProcessor();
        Id batchId=Database.executeBatch(batch,200);
        System.debug('batchId =:'+batchId);
        Test.StopTest();
    }
}