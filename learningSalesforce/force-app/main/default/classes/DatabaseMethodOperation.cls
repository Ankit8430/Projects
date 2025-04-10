public class DatabaseMethodOperation {
    public static void databaseInsertMethod(){
        Account acc=[Select Id from Account where Name='Test13SepAnkit'];
        List<Event__c>eventList=new List<Event__c>{
            new Event__c(Name='EVTest13',Event_Date__c=System.today(),Event_Location__c='L1',Account__c=acc.id),
            new Event__c(Name='EVTest13',Event_Date__c=System.today(),Event_Location__c='L1')    
        };
        Database.SaveResult[] srList=Database.insert(eventList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Successfull => '+sr.getId());
            }else{
                for(Database.Error er:sr.getErrors()){
                    System.debug('Following Error => '+er.getStatusCode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }
       /* List<Account>accList=new List<Account>{
            new Account(Name='Test13SepAnkit'),
            new Account()
        };
        Database.SaveResult[] srList=Database.insert(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Successfully Id => '+sr.getId());
            }else{
                for(Database.Error er:sr.getErrors()){
                    System.debug('Following Error => '+er.getStatuscode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }*/
    }
    public static void databaseUpdateMethod(){
        Event__c event=[Select Id from Event__c where Name='EV1' limit 1];
        event.Event_date__c=System.today();
        Event__c event1=[Select Id from Event__c where Name='EV2' limit 1];
        event1.Event_Date__c=System.today();
        event1.Account__c=null;
        List<Event__c>eventList=new List<Event__c>{event,event1};
        Database.SaveResult[] srList=Database.update(eventList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Successfull => '+sr.getId());
            }else{
                for(Database.Error er:sr.getErrors()){
                    System.debug('Following Error =>'+er.getStatusCode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }
        /*List<Contact>conList=[Select Id from Contact where LastName='Test13Sep'];
        for(Contact con:conList){
            con.LastName=null;
        }
        Database.SaveResult[] srList=Database.update(conList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Sucessfull => '+sr.getId());
            }else{
                for(Database.Error er:sr.getErrors()){
                    System.debug('Following => '+er.getStatusCode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }*/
    }
    public static void databaseUpsertMethod(){
        Account acc=[Select Id from Account where Name='Test13SepAnkit'];
        List<Event__c>eventList=new List<Event__c>();
        Event__c event=[Select ID from Event__c where id='a00WU00000EHtMhYAL'];
        event.Name='EV13Test';
        Event__c event1=[Select Id from Event__c where id='a00WU00000EHtZaYAL'];
        event1.Account__c=null;
        Event__c event2=new Event__c(Name='EVTest13',Event_Date__c=System.today(),Event_Location__c='L1',Account__c=acc.id);
        Event__c event3=new Event__c(Name='EVTest13',Event_Date__c=System.today(),Event_Location__c='L1');
        eventList.add(event);
        eventList.add(event1);
        eventList.add(event2);
        eventList.add(event3);
        Database.UpsertResult[] upList=Database.upsert(eventList,false);
        for(Database.UpsertResult up:upList){
            if(up.isSuccess()){
                System.debug('Successfull =>'+up.getId());
            }else{
                for(Database.Error er:up.getErrors()){
                    system.debug('Following => '+er.getStatusCode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }
        /*Contact con=[Select Id from Contact where lastname='Test13Sep'];
        con.lastName='UpdateTest13Sep';
        Contact con1=new Contact();
        List<Contact>conList=new List<Contact>();
        conList.add(con);
        conList.add(con1);
        Database.UpsertResult[] upList=Database.Upsert(conList,false);
        for(Database.UpsertResult up:upList){
            if(up.isSuccess()){
                System.debug('Successfull => '+up.getId());
            }else{
                for(Database.Error er:up.getErrors()){
                    System.debug('Following => '+er.getStatusCode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }*/
    }
    public static void databaseDeleteMethod(){
        List<Event__c>eventList=[Select Id from Event__c where CreatedDate=today];
        Database.DeleteResult[] dlList=Database.Delete(eventList,false);
        for(Database.DeleteResult dl:dlList){
            if(dl.isSuccess()){
                System.debug('Successfull => '+dl.getId());
            }else{
                for(Database.Error er:dl.getErrors()){
                    System.debug('Following Error=> '+er.getStatusCode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }
        /*List<Contact>conList=[Select Id from Contact];
        Database.DeleteResult[] dlList=Database.Delete(conList,false);
        for(Database.DeleteResult dl:dlList){
            if(dl.isSuccess()){
                System.debug('Successfull => '+dl.getId());
            }else{
                for(Database.Error er:dl.getErrors()){
                    System.debug('Following => '+er.getStatusCode()+' : '+er.getMessage()+' : '+er.getFields());
                }
            }
        }*/
    }
    public static List<Event__c> databaseQueryMethod(String name){
        String query='Select Id,Name from Event__c where Name Like \'%'+String.escapeSingleQuotes(name)+'%\'';
        List<Event__c> eventList=Database.query(query);
        return eventList;
        /*
         String query='Select Id,Name from Account where Name like \'%'+String.escapeSingleQuotes(name)+'%\'';
		 List<Accoun> accList=Database.query(query);
		 return accList;
		*/
    }
}