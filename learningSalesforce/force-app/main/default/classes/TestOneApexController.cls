public class TestOneApexController {
	@AuraEnabled
    public static String getMessage(){
        return 'Hello Ankit!!';
    }
}