public class UpdateOpportunityCloseDate implements Database.Batchable<sObject>,Database.Stateful{
    Integer record=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select Id,CloseDate from Opportunity where StageName='Prospecting']);
    }
    public void execute(Database.BatchableContext bc,List<Opportunity>oppList){
        for(Opportunity opp:oppList){
            opp.CloseDate=System.today()+30;
        }
        Database.SaveREsult[] srList=Database.update(oppList,false);
        for(Database.SaveREsult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLEvel.Error,'Errors =:'+sr.getErrors()[0].getMessage());
        }
        record+=oppList.size();
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Record =:'+record);
    }
}