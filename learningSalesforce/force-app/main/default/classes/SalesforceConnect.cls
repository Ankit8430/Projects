public class SalesforceConnect {
    public static void getAccountDetails(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndPoint('callout:SFDCOrgB/services/apexrest/Account');
        request.setMethod('GET');
        HttpResponse response=Http.send(request);
        if(response.getStatusCode()==200){
            List<Object>results=(List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Object result:results){
                Map<String,Object>accMap=(Map<String,Object>)result;
                System.debug('Account Name =:'+accMap.get('Name'));
                System.debug('Account Phone =:'+accMap.get('Phone'));
            }
        }
    }
    public static void createAccount(){
        String Name='Ankit 19Dec';
        String Phone='123456890';
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndPoint('callout:SFDCOrgB/services/apexrest/Account');
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json; charset=UTF-8');
        request.setBody('{"Name":"Ankit 19Dec","Phone":"123456890"}');
        HttpResponse response=http.send(request);
        if(response.getStatusCode()==201){
            System.debug(response.getBody());
        }
    }
}