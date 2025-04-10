public without sharing class ApexFieldAndObjectSharingSecurity {
    public static void isCreateableMethod(){
        List<Account>accList=new List<Account>();
        if(Schema.sObjectType.Account.isCreateable() &&
          Schema.sObjectType.Account.fields.Name.isCreateable() &&
           Schema.sObjectType.Account.fields.Phone.isCreateable()){
               for(Integer i=0;i<=5;i++){
                   accList.add(new Account(Name='Test'+i,Phone='123456789'+i));
               }
               Database.SaveResult [] srList=Database.insert(accList,false);
               for(Database.SaveResult sr:srList){
                   if(sr.isSuccess())
                       System.debug('ID ==>'+sr.getId());
                   else
                       System.debug(LoggingLevel.Error,'Error =>'+sr.getErrors()[0].getMessage());
               }
           }else {
            System.debug(LoggingLevel.WARN, 'Insufficient permissions to create Account records.');
        }
    }
    public static void isAccessibleAndUpdateable(){
        List<Account>accList=new List<Account>();
        if(Schema.sObjectType.Account.isAccessible() &&
          Schema.sObjectType.Account.fields.Id.isAccessible()&&
          Schema.sObjectType.Account.fields.Name.isAccessible()&&
           Schema.sObjectType.Account.fields.Phone.isAccessible() &&
          Schema.sObjectType.Account.fields.CreatedDate.isAccessible()){
               accList=[Select Id,Name,Phone from Account where CreatedDate=today];
           }
        if(Schema.sObjecttype.Account.isUpdateable() &&
          Schema.sObjectType.Account.Fields.Name.isUpdateable() &&
           Schema.sObjectType.Account.fields.Phone.isUpdateable()){
               for(Account acc:accList){
                   acc.Name='Test 1 Dec'+acc.Name;
               }
           }
        Database.SaveResult[] srList=Database.update(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =>'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error'+sr.getErrors()[0].getMessage());
        }
    }
    public static void isAccessibleAndDeleteable(){
        List<Account>accList=new List<Account>();
        if(Schema.sObjectType.Account.isAccessible() &&
           Schema.sObjectType.Account.fields.Id.isAccessible() &&
          Schema.sObjectType.Account.fields.CreatedDate.isAccessible()){
               accList=[Select Id from Account where CreatedDate=today];
           }
        if(Schema.sObjectType.Account.isDeletable()){
            Database.DeleteResult[] dlList=Database.delete(accList,false);
            for(Database.DeleteResult dl:dlList){
                if(dl.isSuccess())
                    System.debug('Id =>'+dl.getId());
                else
                    System.debug(LoggingLevel.Error,'Error'+dl.getErrors()[0].getMessage());
            }
        }
    }
}