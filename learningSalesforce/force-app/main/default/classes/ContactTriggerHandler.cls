public class ContactTriggerHandler {
    public static void updateTotalContact(List<Contact>newContacts,List<Contact>oldContacts){
     	Map<Id,Decimal>updateTotalContactMap=new Map<Id,Decimal>();
        if(newContacts!=null){
            for(Contact con:newContacts){
                if(con.AccountId!=null){
                    if(!updateTotalContactMap.containsKey(con.AccountId)){
                        updateTotalContactMap.put(con.AccountId,0);
                    }
                    updateTotalContactMap.put(con.AccountId,updateTotalContactMap.get(con.AccountId)+1);
                }
            }
        }
        if(oldContacts!=null){
            for(Contact con:oldContacts){
                if(con.AccountID!=null){
                    if(!updateTotalContactMap.containsKey(con.AccountId)){
                        updateTotalContactMap.put(con.AccountId,0);
                    }
                    updateTotalContactMap.put(con.AccountId,updateTotalContactMap.get(con.AccountId)-1);
                }
            }
        }
        List<Account>updateAccounts=new List<Account>();
        if(!updateTotalContactMap.isEmpty()){
            Map<Id,Account>existingAccounts=new Map<Id,Account>([
                Select Id,Total_Contact__c from Account where Id IN:updateTotalContactMap.keySet()
            ]);
            for(Id accountId:updateTotalContactMap.keySet()){
                Decimal newTotalContact=updateTotalContactMap.get(accountId);
                Account acc=existingAccounts.get(accountId);
                if(acc!=null){
                    acc.Total_Contact__c=(acc.Total_Contact__c!=null?acc.Total_Contact__c:0)+newTotalContact;
                    if(acc.Total_Contact__c<0){
                        acc.Total_Contact__c=0;
                    }
                    updateAccounts.add(acc);
                }
            }
            if(!updateAccounts.isEmpty()){
                update updateAccounts;
            }
        }
    }
    /*public static void updateAccountContry(List<Contact>newContact,Map<Id,Contact>conMap){
        Set<Id>contactIds=new Set<ID>();
        Set<Id>accIds=new Set<Id>();
        for(Contact con:newContact){
            if(con.Account!=null && con.MailingCountry=='India'){
                accIds.add(con.AccountId);
                contactIds.add(con.id);
            }
        }
        List<Account>accList=new List<Account>();
        for(Account acc:[Select Id,BillingCountry from Account where Id=:accIds]){
            acc.BillingCountry='India';
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }
        List<Contact>conList=new List<Contact>();
        for(Contact con:[Select Id,MailingCountry from Contact where AccountId IN:accIds]){
            if(!contactIds.contains(con.Id)){
                con.MailingCountry='India';
                conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }*/
}