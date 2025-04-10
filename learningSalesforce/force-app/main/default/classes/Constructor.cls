public class Constructor {
    public Constructor(){
        System.debug('Non-Parameterized Constructor');
    }
    public Constructor(String name){
        System.debug(name+' Constructor');
    }
    public Constructor(Constructor con){
        System.debug('Copy Constructor');
    }
}