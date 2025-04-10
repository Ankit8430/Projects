@isTest
public class CountBasedOnOriginTest {
	@isTest
    private static void countBasedOnOriginMethodTest(){
        List<Account>accList=new List<Account>();
        for(Integer i=0;i<=10;i++){
            accList.add(new Account(Name='TEst'+i));
        }
        Database.SaveResult[] srList=Database.insert(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        List<Case>caseList=new List<Case>();
        for(Account acc:accList){
            caseList.add(new Case(Origin='Email',AccountId=acc.id));
            caseList.add(new Case(Origin='Phone',AccountId=acc.id));
            caseList.add(new Case(Origin='Web',AccountId=acc.id));
            caseList.add(new Case(Origin='Email',AccountId=acc.id));
            caseList.add(new Case(Origin='Phone',AccountId=acc.id));
            caseList.add(new Case(Origin='Web',AccountId=acc.id));
        }
        srList=database.insert(caseList,false);
        for(Database.SaveREsult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        Set<Id>accIDs=new Set<Id>();
        for(Account acc:accList){
            accIds.add(acc.id);
        }
        Test.startTest();
        CountBasedOnOrigin.countBasedOnOriginMethod(accIDs);
        Test.stopTest();
        List<Account>updateAccounts=[Select Id,CaseFromEmail__c,CaseFromPhone__c,CaseFromWeb__c from Account where Id =:accList[0].Id];
        System.assertEquals(updateAccounts[0].CaseFromEmail__c,2);
        System.assertEquals(updateAccounts[0].CaseFromPhone__c,2);
        System.assertEquals(updateAccounts[0].CaseFromWeb__c,2);
    }
}