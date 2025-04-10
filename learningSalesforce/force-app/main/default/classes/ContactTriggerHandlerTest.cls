@isTest
public class ContactTriggerHandlerTest {
	@testSetup
    public static void testSetup(){
        Account acc=new Account(Name='Test');
        insert acc;
        Account acc1=new Account(Name='Test1',Total_Contact__c=-2);
        insert acc1;
        List<Contact>conList=new List<Contact>();
        conList.add(new Contact(LastName='Test1',AccountId=acc.Id));
        conList.add(new Contact(LastName='Test2',AccountId=acc.Id));
        conList.add(new Contact(LastName='Test3',AccountId=acc.Id));
        conList.add(new Contact(LastName='Test4',AccountId=acc1.Id));
        insert conList;
    }
    @isTest
    public static void testMethod1(){
        Account acc=[Select Id,Total_Contact__c from Account where Name='Test'];
        system.assertEquals(acc.Total_Contact__c,3);
    }
    @isTest
    public static void testMethod2(){
       List<Contact>conList=[Select Id,LastName,AccountId from Contact];
        for(Contact con:conList){
            if(con.LastName=='Test3'){
                con.AccountId=null;
            }
        }
        Test.StartTest();
        update conList;
        Test.stopTest();
        Account acc=[Select Id,Total_Contact__c from Account where Name='Test'];
        system.assertEquals(acc.Total_Contact__c,2);
    }
    @isTest
    public static void testMethod3(){
        List<Contact>conList=[Select Id,LastName,AccountId from Contact];
        Test.StartTest();
        delete conList;
        Test.stopTest();
        Account acc=[Select Id,Total_Contact__c from Account where Name='Test'];
        system.assertEquals(acc.Total_Contact__c,0);
    }
}