@isTest
public class RevisionTestClass {
    @testSetup
    private static void testSetup(){
        List<Account>accList=new List<Account>();
        for(Integer i=0;i<=5;i++){
            accList.add(new Account(Name='Test14Sep24'+i,Phone='1234567892'));
        }
        insert accList;
        List<Contact>conList=new List<Contact>();
        for(Account acc:accList){
            conList.add(new Contact(LastName='Cont'+acc.Name,AccountId=acc.id));
        }
        insert conList;
        List<Event__c> eventList=new List<Event__c>();
        for(Account acc:accList){
            eventList.add(new Event__c(Name='Test'+acc.Name,Event_date__c=System.today(),Event_location__c='Location',Account__c=acc.id));
        }
        insert eventList;
        List<Event_Registrations__c>eventReList=new List<Event_Registrations__c>();
        for(Event__c event:eventList){
            eventReList.add(new Event_Registrations__c(Name='Test'+event.Name,Event__c=event.id));
        }
        insert eventReList;
    }
	@isTest
    private static void breakAndContinueTest(){
        Test.startTest();
        Revision.breakAndContinue();
        Test.StopTest();
    }
    @isTest
    private static void listOperarionTest(){
        Test.startTest();
        Revision.listOperarion();
        Test.stopTest();
        List<account>accList=[Select Id from Account where Name like '%Test14Sep24%'];
        System.assertEquals(accList.size(),6);
    }
    @isTest
    private static void mapOperationsTest(){
        Test.startTest();
        Revision.mapOperations();
        Test.stopTest();
        List<Contact>conList=[Select ID,Phone,Account.Phone from Contact where phone!=null];
        for(Contact con:conList){
            System.assertEquals(con.Phone,con.Account.Phone);
        }
    }
    @isTest
    private static void apexSharingSettingTest(){
        Test.startTest();
        Revision.apexSharingSetting();
        Test.stopTest();
    }
    @isTest
    private static void databaseInsertOperationTest(){
        Test.startTest();
        Revision.databaseInsertOperation();
        Test.stopTest();
    }
    @isTest
    private static void databaseUpdateOperationTest(){
        test.startTest();
        Revision.databaseUpdateOperation();
        Test.stopTest();
    }
    @isTest
    private static void databaseUpsertOperationTest(){
        Test.startTest();
        Revision.databaseUpsertOperation();
        Test.stopTest();
    }
    @isTest
    private static void databaseDeletOperationTest(){
        Test.startTest();
        Revision.databaseDeletOperation();
        Test.stopTest();
    }
    @isTest
    private static void soqlParentToChildStandardObjectTest(){
        test.startTest();
        Revision.soqlParentToChildStandardObject();
        test.stopTest();
    }
    @isTest
    private static void soqlChildToParentStandardOBjectTest(){
        Test.startTest();
        Revision.soqlChildToParentStandardOBject();
        Test.stopTest();
    }
    @isTest
    private static void soqlParentToChildCustomObjectTest(){
        Test.startTEst();
        Revision.soqlParentToChildCustomObject();
        Test.stopTest();
    }
    @isTest
    private static void soqlChildToParentCustomObjectTest(){
        Test.startTEst();
        Revision.soqlChildToParentCustomObject();
        Test.stopTest();
    }
}