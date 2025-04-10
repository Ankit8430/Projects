public class Spoonacular {
    private static final String Spoonacular_API='https://api.spoonacular.com';
    private static final String API_Key='17c14767e8934c79a43a895a5c61def8';
    public static String getRandomRecipes(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndPoint(Spoonacular_API+'/recipes/random?apiKey='+API_Key);
        request.setMethod('GET');
        HttpResponse response=http.send(request);
        System.debug('Response Status Code =: '+response.getStatusCode());
        if(response.getStatusCode()==200){
            System.debug('response =:'+response.getBody());
            return response.getBody();
        }
        return '';
    }
    public static String getRecipeIngredients(String ingredients){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndPoint(Spoonacular_API+'/recipes/findByIngredients?apiKey='+API_Key+'&ingredients='+ingredients);
        request.setMethod('GET');
        HttpResponse response=http.send(request);
        System.debug('Status Code =:'+response.getStatusCode());
        if(response.getStatusCode()==200){
            System.debug('Response =:'+response.getBody());
            return response.getBody();
        }
        return '';
    }
    public static String getRecipe(String recipeId){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(Spoonacular_API+'/recipes/'+recipeId+'/information?apiKey='+API_Key);
        //recipes/{id}/information
        request.setMethod('GET');
        HttpResponse response=http.send(request);
        System.debug('Status Code =:'+response.getStatusCode());
        if(response.getStatusCode()==200){
            System.debug('Reponse =:'+response.getBody());
            return response.getBody();
        }
        return '';
    }
}