public with sharing class ContactController1 {
    @AuraEnabled(cacheable=true)
    public static List<contact> getContactsList(){
        return  [Select Id,Name,Title,Email from Contact];
    }
}