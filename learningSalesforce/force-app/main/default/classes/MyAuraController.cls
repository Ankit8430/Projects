public class MyAuraController {
	@AuraEnabled
    public static String getServerMessage(){
        return 'Hello from Apex!';
    }
}