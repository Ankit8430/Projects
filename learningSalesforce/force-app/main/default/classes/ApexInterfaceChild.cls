public class ApexInterfaceChild implements ApexInterface,ApexInterfaceB {
    public void show(){
        System.debug('show');
    }
    public void display(){
        System.debug('Display');
    }
}