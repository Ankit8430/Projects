public class OppProcessorSchedulable implements Schedulable {
    public void execute(SchedulableContext sc){
        OppProcessor op=new OppProcessor();
        Id batchId=Database.executeBatch(op,200);
    }
}