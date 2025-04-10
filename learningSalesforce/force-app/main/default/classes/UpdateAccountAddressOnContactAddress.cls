public class UpdateAccountAddressOnContactAddress implements Database.Batchable<sObject>,Database.Stateful{
    Integer record=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select Id,BillingCity,BillingState,BillingStreet,BillingPostalCode,(Select Id,MailingCity,MailingState,MailingStreet,
                                           MailingPostalCode from Contacts) from Account]);
    }
    public void execute(Database.BatchableContext bc,List<Account>accList){
        List<Contact>conList=new List<Contact>();
        for(Account acc:accList){
            for(Contact con:acc.Contacts){
                con.MailingCity=acc.BillingCity;
                con.MailingState=acc.BillingState;
                con.MailingStreet=acc.BillingStreet;
                con.MailingPostalCode=acc.BillingPostalCode;
                conList.add(con);
                record++;
            }
        }
        Database.SaveResult[] srList=Database.update(conList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Record =:'+record);
    }
}