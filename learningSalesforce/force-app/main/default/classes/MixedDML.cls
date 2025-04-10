public class MixedDML {
    public static void useFutureMethod(){
		Account acc=new Account(name='Test');
        insert acc;
        UTIL.insertUserWithRole();
    }
}