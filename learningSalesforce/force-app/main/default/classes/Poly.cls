public virtual class Poly {
    //Method Overloadding or Complie Time Polymo
    public void printName(){
        system.debug('Hi, I am Ankit Gupta');
    }
    public virtual void printName(String name){
        System.debug('Hi, I am '+name);
    }
}