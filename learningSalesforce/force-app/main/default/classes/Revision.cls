public class Revision {
    public static void breakAndContinue(){
        for(Integer i=0;i<=10;i++){
            if(i==5) break;
            system.debug(i);
        }
        for(Integer i=0;i<=10;i++){
            if(i==5) continue;
            system.debug(i);
        }
    }
    public static void listOperarion(){
        List<Account>accList=new List<Account>();
        for(Integer i=0;i<=10;i++){
            accList.add(new Account(Name='Test'+i));
        }
        if(!accList.isEmpty()){
            Database.SaveResult[] srList=Database.insert(accList,false);
            for(Database.SaveResult sr:srList){
                if(sr.isSuccess()){
                    System.debug('ID => '+sr.getId());
                }else{
                    for(Database.Error err:sr.getErrors()){
                        System.debug('Following => '+err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                    }
                }
            }
            
        }
    }
    public static void mapOperations(){
        List<Account>accList=[Select Id,Phone from Account where phone!=null];
        Map<Id,Account>idToAccMap=new Map<Id,Account>(accList);
        List<Contact>conList=[Select Id,Phone,AccountId from Contact where accountId IN: idToAccMap.keySet()];
        List<Contact>conListUpdate=new List<Contact>();
        for(Contact con:conList){
            con.Phone=idToAccMap.get(con.AccountId).Phone;
            conListUpdate.add(con);
        }
        if(!conListUpdate.isEmpty()){
            Database.SaveResult[] srList=database.update(conListUpdate,false);
            for(Database.SaveResult sr:srList){
                if(sr.isSuccess()){
                    System.debug('ID =>'+sr.getId());
                }else{
                    for(Database.Error err:sr.getErrors()){
                        System.debug('Following : '+err.getStatusCode()+' '+err.getMessage()+' '+err.getFields());
                    }
                }
            }
        }
    }
    public static void apexSharingSetting(){
        if(Schema.sObjectType.Account.isCreateable()){
            if(Schema.sObjectType.Account.fields.Name.isCreateable() &&
              Schema.sObjectType.Account.fields.Phone.isCreateable()){
                
            }
        }
        if(Schema.sObjectType.Account.isAccessible()){
            if(Schema.sObjectType.Account.fields.Name.isAccessible() &&
              Schema.sObjectType.Account.fields.Phone.isAccessible()){
                
            }
        }
        if(Schema.sObjectType.Account.isUpdateable()){
            if(Schema.sObjectType.Account.fields.Name.isUpdateable() &&
              Schema.sObjectType.Account.fields.Phone.isUpdateable()){
                
            }
        }
        if(Schema.sObjectType.Account.isDeletable()){
        }
    }
    public static void databaseInsertOperation(){
        List<Account>accList=new List<Account>();
        for(Integer i=1;i<=10;i++){
            accList.add(new Account(Name='text'+i));
        }
         accList.add(new Account());
        if(!accList.isEmpty()){
            Database.SaveResult[] srList=Database.insert(accList,false);
            for(Database.SaveResult sr:srList){
                if(sr.isSuccess()){
                    System.debug('Id => '+sr.getID());
                }else{
                    for(Database.Error err:sr.getErrors()){
                        System.debug('F=>'+err.getStatusCode()+':'+err.getMessage()+':'+err.getFields());
                    }
                }
            }
        }
    }
    public static void databaseUpdateOperation(){
        List<Account>accList=[Select Id from Account where Name like '%Test%'];
        for(Account acc:accList){
            acc.Name='Test14Sep';
        }
        accList[0].Name=null;
        if(!accList.isEmpty()){
            Database.SaveResult[] srList=database.update(accList,false);
            for(Database.SaveResult sr:srList){
                if(sr.isSuccess()){
                    System.debug('ID =>'+sr.getID());
                }else{
                    for(Database.Error err:sr.getErrors()){
                        system.debug(err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                    }
                }
            }
        }
    }
    public static void databaseUpsertOperation(){
        List<Account>accList=new List<Account>();
        Account acc=new Account(Name='Test');
        Account acc1=[Select Id from Account where Name like '%Test%' limit 1];
        acc1.Name='Ankit';
        Account acc2=new Account();
        accList.add(acc);
        accList.add(acc1);
        accList.add(acc2);
        if(!accList.isEmpty()){
            Database.UpsertResult[] upList=Database.upsert(accList,false);
            for(Database.UpsertResult up:upList){
                if(up.isSuccess()){
                    System.debug('Id =>'+up.getId());
                }else{
                    for(Database.Error err:up.getErrors()){
                        System.debug(err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                    }
                }
            }
        }
    }
    public static void databaseDeletOperation(){
        List<Account>accList=[Select Id from Account];
        if(!accList.isEmpty()){
            Database.DeleteResult[] dlList=Database.Delete(accList,false);
            for(Database.DeleteResult dl:dlList){
                if(dl.isSuccess()){
                    System.debug(dl.getID());
                }else{
                    for(Database.Error err:dl.getErrors()){
                        system.debug(err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                    }
                }
            }
        }
    }
    public static void soqlParentToChildStandardObject(){
        List<Account>accList=[Select Id,Name,(Select LastName from Contacts) from Account];
        for(Account acc:accList){
            for(Contact con:acc.Contacts){
                System.debug('Account Name: '+acc.Name+' Contact LastName: '+con.LastName);
            }
        }
    }
    public static void soqlChildToParentStandardOBject(){
        List<Contact>conList=[Select LastName, Account.Name from Contact];
        for(Contact con:conList){
            System.debug('LastName: '+con.LastName+' Account Name '+con.Account.Name);
        }
    }
    public static void soqlParentToChildCustomObject(){
        List<Event__c>eventList=[Select Id,Name,(Select Name from Event_Registrations__r) from event__c];
        for(Event__c event:eventList){
            for(Event_Registrations__c eve:event.Event_Registrations__r){
                System.debug('Event Name: '+event.Name+' Registration Name :'+eve.Name);
            }
        }
    }
    public static void soqlChildToParentCustomObject(){
        List<Event_Registrations__c>eventRegiList=[Select Name,Event__r.Name from Event_Registrations__c];
        for(Event_Registrations__c ev:eventRegiList){
            System.debug('Event Name: '+ev.Event__r.Name+' Regist Name: '+ev.Name);
        }
    }
}