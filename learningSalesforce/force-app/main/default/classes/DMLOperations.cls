public class DMLOperations {
    public static void insertAccount(){
        try{
            Account acc=new Account(Name='AmanTest13Sep');
            insert acc;
            Event__c event=new Event__c(Name='EV13Sept',Event_Date__c=System.today(),Event_Location__c='Location 1',Account__c=acc.id);
            insert event;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
    public static void updateAccount(){
        try{
            /*List<Account>accList=[Select Id from Account where Name='AnkitTest13Sep'];
            for(Account acc:accList){
                acc.Name='AnkitTest13Sep';
            }
            update accList;*/
            List<Event__c>eventList=[Select Id from Event__c where Name='EV13Sept'];
            for(Event__c event:eventList){
                event.Event_Location__c='Location 13 Sep';
            }
            update eventList;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }

    }
    public static void upsertAccont(){
        try{
            List<Event__c>eventList=new List<Event__c>();
            Account acc=[Select Id from Account where name='AmanTest13Sep'];
            Event__c event1=[Select Id from Event__c where Name='EV13Sept'];
            event1.Name='Ev13Sept1';
            Event__c event=new Event__c(Name='EV13Sept2',Event_Date__c=System.today(),Event_Location__c='Location 1',Account__c=acc.id);
            eventList.add(event1);
            eventList.add(event);
            upsert eventList;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
    public static void deleteAccount(){
        try{
            List<Event__c>eventList=[Select Id from Event__c where createdDate=today];
            delete eventList;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
    public static void undeleteAccount(){
        try{
            List<Event__c>eventList=[Select Id from Event__c where createdDate=today All Rows];
            undelete eventList;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
}