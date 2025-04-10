public class UpdateOpportunityCloseDateSchedule implements Schedulable{
    public void execute(SchedulableContext sc){
        UpdateOpportunityCloseDate uoc=new UpdateOpportunityCloseDate();
        Id batchId=Database.executeBatch(uoc,200);
        System.debug('Batch Id =:'+batchId);
    }
}