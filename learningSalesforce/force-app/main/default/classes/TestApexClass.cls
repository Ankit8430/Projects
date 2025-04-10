public class TestApexClass {
    public static Integer returnSumOfTwoNumber(integer a,integer b){
        return a+b;
    }
    public static Account createAccount(String name){
        Account acc=new Account(Name=name);
        insert acc;
        return acc;
    }
    public static void updateAccount(){
		Account acc=new Account(Name='Test10Sep24');
        insert acc;
        List<account>accList=new List<Account>([Select Name from Account where Name='Test10Sep24']);
        for(Account acc1:accList){
            acc1.Name='Aman';
        }
        update accList;
    }
    public static void deleteAccount(){
       List<account>accList=new List<Account>([Select Name from Account where Name='Test10Sep24']);
       delete accList;
    }
}