public class CountBasedOnOrigin {
	@future
    public static void countBasedOnOriginMethod(Set<Id>accIds){
        List<Account>accList=[Select Id,CaseFromEmail__c,CaseFromPhone__c,CaseFromWeb__c from Account Where Id IN:accIDs];
       	Map<Id,Decimal>caseEmailMap=new Map<Id,Decimal>();
        Map<Id,Decimal>casePhoneMap=new Map<Id,Decimal>();
        Map<Id,Decimal>caseWebMap=new Map<Id,Decimal>();
        for(Case ca:[Select Id,Origin,AccountId from Case where AccountId IN:accIds and origin!=null]){
            if(!caseEmailMap.containsKey(ca.AccountId) && ca.Origin=='Email'){
                caseEmailMap.put(ca.AccountId,1);
            }else if(caseEmailMap.containsKey(ca.AccountId) && ca.Origin=='Email'){
                caseEmailMap.put(ca.AccountId,caseEmailMap.get(ca.AccountId)+1);
            }else if(!casePhoneMap.containsKey(ca.AccountId) && ca.Origin=='Phone'){
                casePhoneMap.put(ca.AccountId,1);
            }else if(casePhoneMap.containsKey(ca.AccountId) && ca.Origin=='Phone'){
                casePhoneMap.put(ca.AccountId,casePhoneMap.get(ca.AccountId)+1);
            }else if(!caseWebMap.containsKey(ca.AccountId) && ca.Origin=='Web'){
                caseWebMap.put(ca.AccountId,1);
            }else if(caseWebMap.containsKey(ca.AccountId) && ca.Origin=='Web'){
                caseWebMap.put(ca.AccountId,caseWebMap.get(ca.AccountId)+1);
            }
        }
        for(Account acc:accList){
            acc.CaseFromEmail__c=caseEmailMap.get(acc.Id);
            acc.CaseFromPhone__c=casePhoneMap.get(acc.Id);
            acc.CaseFromWeb__c=caseWebMap.get(acc.Id);
        }
        Database.SaveResult[] srList=Database.update(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(loggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
    }
}