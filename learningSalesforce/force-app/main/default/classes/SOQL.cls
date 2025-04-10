public class SOQL {
    public static void fromParentToChildStandardObject(){
       List<Account>accList=[Select Id,Name,(Select LastName from Contacts) from Account];
        for(Account acc:accList){
            System.debug(acc.Name+' Account');
            for(Contact con:acc.Contacts){
                System.debug(con.LastName+' Contact');
            }
        }
    }
    public static void fromParentToChildCustomObject(){
        List<Account>accList=[Select Id,Name,(Select Name from Events__r) from Account];
        for(Account acc:accList){
            System.debug(acc.Name);
            for(Event__c event:acc.Events__r){
                System.debug(event.Name);
            }
        }
    }
    public static void fromChildToParentCustomObject(){
        List<Event__c>eventList=[Select Id,Name,Account__r.Name from Event__c];
        for(Event__c event:eventList){
            System.debug('Event Name: '+event.Name+' Account Name: '+event.Account__r.Name);
        }
    }
    public static void fromChildToParentStandardObject(){
        List<Contact>conList=[Select Id,LastName,Account.Name from Contact];
        for(Contact con:conList){
            System.debug('LastName: '+con.LastName+' Account Name: '+con.Account.Name);
        }
    }
    public static void createOppRelatedToAccount(){
        List<Account>accList=[Select Id,Name from Account where createdDate=this_year];
        List<Opportunity>oppList=new List<Opportunity>();
        if(!accList.isEmpty()){
            for(Account acc:accList){
                Opportunity opp=new Opportunity();
                opp.Name='Opp '+acc.Name;
                opp.CloseDate=System.today();
                opp.StageName='Prospecting';
                oppList.add(opp);
            }
        }
        Database.SaveResult[] srList=Database.insert(oppList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Succcessfull => '+sr.getId());
            }else{
                for(Database.Error err:sr.getErrors()){
                    System.debug('Following => '+err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                }
            }
        }
    }
    public static void updatePhoneOnAccount(){
        List<Account>accList=[Select Id,Phone from Account where CreatedDate=last_week];
        for(Account acc:accList){
            acc.Phone='1234567890';
        }
        Database.SaveResult[] srList=Database.update(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Id :'+sr.getId());
            }else{
                for(Database.Error err:sr.getErrors()){
                    System.debug('Following :'+err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                }
            }
        }
    }
    public static void updateOppDescription(){
        List<Opportunity>oppList=[Select Id,StageName,Description from Opportunity where StageName='Closed Won' or StageName='Closed Lost'];
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                opp.Description='Oppotunity is '+opp.StageName;
            }
        }
        Database.SaveResult[] srList=Database.update(oppList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Id =: '+sr.getId());
            }else{
                for(Database.Error err:sr.getErrors()){
                    System.debug('Following : '+err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                }
            }
        }
    }
    public static void updateTotalContactOnAccount(){
        List<Account>accList=[Select Id,(Select Id from Contacts) from Account where CreatedDate=last_week];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Total_Contact__c=acc.Contacts.size();
            }
        }
        Database.SaveResult[] srList=Database.update(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                system.debug('Id =>'+sr.getId());
            }else{
                for(Database.Error err:sr.getErrors()){
                    System.debug('Following => '+err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                }
            }
        }
    }
    public static void updatePhoneOnContactRelatedToAccount(){
        List<Contact>conList=[Select Id,Phone,Account.Phone from Contact where createdDate=last_week and phone=null];
        if(!conList.isEmpty()){
            for(Contact con:conList){
                con.Phone=con.Account.Phone;
            }
        }
        Database.SaveResult[] srList=Database.update(conList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Id =>'+sr.getId());
            }else{
                for(database.Error err:sr.getErrors()){
                    System.debug('Following '+err.getStatusCode()+' '+err.getMessage()+' '+err.getFields());
                }
            }
        }
    }
    public static void updatePhoneOnEventRelatedToAccount(){
        List<Event__c>eventList=[Select Id,Phone__c,Account__r.Phone from event__c where createdDate=this_year or phone__c=null];
        if(!eventList.isEmpty()){
            for(Event__c event:eventList){
                event.Phone__c=event.Account__r.Phone;
            }
        }
        Database.SaveResult[] srList=database.update(eventList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
                System.debug('Id=>'+sr.getID());
            }else{
                for(Database.Error err:sr.getErrors()){
                    system.debug('Following: '+err.getStatusCode()+' '+err.getMessage()+' '+err.getFields());
                }
            }
        }
    }
    public static void updatePhoneFromAccountParentToChildContact(){
        List<Contact>conList=new List<Contact>();
        for(Account acc:[Select Id,Phone,(Select Id,Phone from Contacts) from Account where createdDate=last_week and phone!=null]){
            for(Contact con:acc.Contacts){
                con.Phone=acc.Phone;
                conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            Database.SaveResult[] srList=database.update(conList,false);
            for(database.saveresult sr:srList){
                if(sr.isSuccess()){
                    System.debug('Id=> '+sr.getId());
                }else{
                    for(Database.Error err:sr.getErrors()){
                           System.debug('Following : '+err.getStatusCode()+': '+err.getMessage()+' '+err.getFields()); 
                    }
                }
            }
        }
    }
    public static void updatePhoneFromAccountParentToChildContactUsingMap(){
        List<Account>accList=[Select Id,Phone from Account where CreatedDate=this_year and phone!=null];
        Map<Id,Account>mapIdToAccount=new Map<Id,Account>(accList);
        List<Contact>conList=[Select Id,Phone,AccountID from Contact where AccountId=:mapIdToAccount.keySet()];
        List<Contact>conListToUpdate=new List<Contact>();
        for(Contact con:conList){
            con.Phone=mapIdToAccount.get(con.AccountId).Phone;
            conListToUpdate.add(con);
        }
        if(!conListToUpdate.isEmpty()){
            Database.SaveResult[] srList=database.update(conListToUpdate,false);
            for(Database.saveresult sr:srList){
                if(sr.isSuccess()){
                    System.debug('Id => '+sr.getId());
                }else{
                    for(database.error err:sr.getErrors()){
                        System.debug('Following :'+err.getStatusCode()+' : '+err.getMessage()+' : '+err.getFields());
                    }
                }
            }
        }
    }
}