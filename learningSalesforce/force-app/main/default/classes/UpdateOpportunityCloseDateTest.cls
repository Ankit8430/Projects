@isTest
public class UpdateOpportunityCloseDateTest {
	@isTest
    private static void testMEthod1(){
        List<Opportunity>oppList=new List<Opportunity>();
        for(Integer i=0;i<=10;i++){
            oppList.add(new Opportunity(Name='Opp'+i,StageName='Prospecting',CloseDate=System.today()));
        }
        Database.SaveResult[] srList=Database.insert(oppList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                system.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        Test.startTest();
        UpdateOpportunityCloseDate uoc=new UpdateOpportunityCloseDate();
        Id batchId=DAtabase.executeBatch(uoc,200);
        System.debug('Batch Id =:'+batchId);
        Test.stopTEst();
        List<Opportunity>updateOpps=[Select Id,CloseDAte from Opportunity where Name like '%Opp%'];
        System.assertEquals(updateOpps[0].CloseDAte,System.today()+30);
    }
}