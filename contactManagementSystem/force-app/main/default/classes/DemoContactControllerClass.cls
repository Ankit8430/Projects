public with sharing class DemoContactControllerClass {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts(String searchKeyword){
        if(String.isNotBlank(searchKeyword)){
            String searchword='%'+searchKeyword+'%';
            return[Select Id,FirstName,LastName,Email,
            Phone,Title,AccountId,Account.Name from Contact 
            where AccountId!=null and (FirstName like: searchword or LastName like:searchword)];
        }else{
            return[Select Id,FirstName,LastName,Email,
            Phone,Title,AccountId,Account.Name from Contact 
            where AccountId!=null];
        }
    }

    @AuraEnabled
    public static void deleteContact(String contactId){
        List<Contact>conList=[Select Id from Contact where Id =:contactId];
        delete conList;
    }

    @AuraEnabled 
    public static void deleteBulkContactData(List<Id> listContactIds){
        List<Contact> conList=[Select Id from Contact where Id IN: listContactIds];
        delete conList;
    }
}