public class UpdateAccountAddressOnContactSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        UpdateAccountAddressOnContactAddress uac=new UpdateAccountAddressOnContactAddress();
        Id batchId=Database.executeBatch(uac);
        System.debug('BatchId =:'+batchId);
    }
}