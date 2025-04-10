@isTEst
public class UpdateOpportunityCloseDateScheduleTEst {
	@isTest
    private static void testMethod1(){
        List<Opportunity>oppList=new List<Opportunity>();
        for(Integer i=0;i<=200;i++){
            oppList.add(new Opportunity(Name='Opp'+i,StageName='Prospecting',CloseDAte=System.today()));
        }
        Database.SaveREsult[] srList=Database.insert(oppList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        Test.startTEst();
        String sch='0 0 0 ? * * *';
        UpdateOpportunityCloseDateSchedule uc=new UpdateOpportunityCloseDateSchedule();
        string jobId=System.schedule('opp',sch,uc);
        System.debug('Job Id =:'+jobId);
        Test.stopTest();
    }
}