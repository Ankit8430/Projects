public class UTIL {
	@future
    public static void insertUserWithRole(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        // Create new user with a non-null user role ID 
        User u = new User(alias = 'mruiz', email='mruiz@awcomputing.com', 
            emailencodingkey='UTF-8', lastname='Ruiz', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='mruiz@awcomputing.com');
        insert u;
    }
}