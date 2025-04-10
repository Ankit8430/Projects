public class ApexSharingSettings {
    public static void createable(){
        if(Schema.sObjectType.Account.isCreateable()){
            if(Schema.sObjectType.Account.fields.NAme.isCreateable()&&
               Schema.sObjectType.Account.fields.Phone.isCreateable()){
                   Account acc=new Account();
                   acc.Name='Aman';
                   acc.Phone='1234567890';
                   insert acc;
               }
        }
    }
    public static void accessiable(){
        if(Schema.sObjectType.Account.isAccessible()){
            if(Schema.sObjectType.Account.fields.Name.isAccessible() &&
               Schema.sObjectType.Account.fields.phone.isAccessible() &&
              Schema.sObjectType.Account.fields.Id.isAccessible()){
                   List<account>accList=[Select Id,Name,Phone from Account];
               }
        }
    }
    public static void updateable(){
        if(Schema.sObjectType.Account.isUpdateable()){
            if(Schema.sObjectType.Account.fields.Id.isUpdateable() &&
              Schema.sObjectType.Account.fields.Name.isUpdateable() &&
               Schema.sObjectType.Account.fields.Phone.isUpdateable()){
             	List<Account>accList=[Select Id,Name,Phone from Account];
                   for(Account acc:accList){
                       acc.NAme='Aman';
                       acc.Phone='1234567890';
                   }
                   update accList;
             }
        }
    }
    public static void deletable(){
        if(Schema.sObjectType.Account.isDeletable()){
			List<Account>accList=[Select Id from Account];
            delete accList;
        }
    }
}