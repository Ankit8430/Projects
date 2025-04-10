@isTest
public class TestClass {
	@isTest
    private static void returnSumOfTwoNumberTest(){
        Integer sum=TestApexClass.returnSumOfTwoNumber(2,3);
        System.assertEquals(5,sum);
    }
    @isTest
    private static void createAccountTest(){
        test.startTest();
        Account acc=TestApexClass.createAccount('Ankit');
        test.stopTest();
        System.assertEquals('Ankit',acc.Name);
    }
    @isTest
    private static void createMultipleAccount(){
        List<Account>accList=new List<Account>();
        for(Integer i=1;i<=10;i++){
            accList.add(new Account(name='Test'+i));
        }
        test.startTest();
        insert accList;
        Test.stopTest();
        System.assertEquals(accList[0].Name,'Test1');
        System.assertEquals(10,accList.size());
    }
    @isTest
    private static void updateAccountTest(){
        List<account>accList=new List<Account>();
        accList=[Select Name from Account where Name='Test10Sep24'];
        Test.startTest();
        TestApexClass.updateAccount();
        Test.stopTest();
    }
    @isTest
    private static void deleteAccount(){
		Account acc=new Account(Name='Test');
        insert acc;
        test.startTest();
        delete acc;
        TestApexClass.deleteAccount();
        test.stopTest();
    }
}