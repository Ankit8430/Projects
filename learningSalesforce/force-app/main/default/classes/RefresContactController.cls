public with sharing class RefresContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        return [Select Id,FirstName,LastName,Email from Contact LIMIT 10];
    }
}