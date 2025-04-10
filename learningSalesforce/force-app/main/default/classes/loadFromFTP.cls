public class loadFromFTP {
    
    @AuraEnabled
    public static String getCSV(String csvName)
    {
        String endpoint = 'https://www.ftp-api.com/ftp/download?fileName='+csvName +'.csv';
        String username = 'WZhsnssHHGWU9TJI7XF2CUa0yVlNGweR';
        String password = 'dc052337ca1c4ee2afd15aa5073ee3d3';
        String ftpHost = 'us-east-1.sftpcloud.io'; //Host will remain same if you are using same hosting service
        Integer ftpPort = 22; 
        String ftpType = 'SFTP'; 
        
        // Set up the request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('username', username);
        req.setHeader('password', password);
        req.setHeader('port', String.valueOf(ftpPort));
        req.setHeader('ftp-host', ftpHost);
        req.setHeader('ftp-type', ftpType);
        req.setHeader('path', '/');
        req.setTimeout(30000);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            // Get the file content
            String fileContent = res.getBody();
            // Get the file name
            String fileName = 'sample.txt';
            
            // Log the file name and content
            System.debug('File Name: ' + fileName);
            System.debug('File Content: ' + fileContent);
        } else {
            System.debug('Error downloading file. Status code: ' + res.getStatusCode());
        }
        
        // Get the file content
        String fileContent = res.getBody();
        Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(fileContent);
        List<Object> filesList = (List<Object>) responseMap.get('Files');
        String csvContentBase64 = (String) ((Map<String, Object>) filesList[0]).get('body');
        Blob csvBlob = EncodingUtil.base64Decode(csvContentBase64);
        
        String csvData = CsvBlob.toString();
        
        System.debug('CSV Data : ' + csvData);   
        
        return csvData;
        
    }
    
}