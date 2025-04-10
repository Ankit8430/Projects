public with sharing class FileUploader {
    @AuraEnabled
    public static String insertAccounts(List<Map<String, Object>> data) {
        System.debug('ACCOUNT DATA: ' + data);
        List<Account> accounts = new List<Account>();
        for (Map<String, Object> row : data) {
            Account account = new Account();
            account.Name = String.valueOf(row.get('Name'));
            account.Phone = String.valueOf(row.get('Phone'));
            accounts.add(account);
        }
        if (!accounts.isEmpty()) {
            insert accounts;
        }
        String successMsg = 'DML Successful';
        System.debug(successMsg);
        return successMsg;
    }
}