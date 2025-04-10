public class InsertDummyContactRecord implements Queueable {
    String firstName='';
    String lastName='';
    public InsertDummyContactRecord(String firstName,String lastName){
        this.firstName=firstName;
        this.lastName=lastName;
    }
    public void execute(QueueableContext qc){
        List<Contact>conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            conList.add(new Contact(FirstName=firstName+i,LastName=lastName+i));
        }
        DAtabase.SaveREsult [] srList=Database.insert(conList,false);
        for(Database.SaveREsult sr:srList){
            if(Sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Errors =:'+sr.getErrors()[0].getMessage());
        }
    }
}