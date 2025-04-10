public class UpdateParentAccount implements Queueable {
    Id parentId;
    List<Account>accList;
    public UpdateParentAccount(List<Account>accList,Id parentId){
 		this.accList=accList;
        this.parentId=parentId;
    }
    public void execute(QueueableContext qc){
        for(Account acc:accList){
            acc.ParentId=parentId;
        }
        Database.SaveResult[] srList=Database.update(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
    }
}