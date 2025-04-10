public class OppProcessor implements Database.batchable<sObject>,Database.stateful{
    Integer record=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select Id,LeadSource from Opportunity where LeadSource!='Web']);
    }
    public void execute(Database.BatchableContext bc,List<Opportunity>oppList){
        for(Opportunity opp:oppList){
            opp.LeadSource='Web';
        }
        record+=oppList.size();
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Record =:'+record);
    }
}