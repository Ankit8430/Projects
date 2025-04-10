public virtual class Child2  extends Parent{
    public Child2(){
        System.debug('Child2 Class');
    }
    public void child2(){
        System.debug('Child2');
    }
}
/*
YourChild yc=new YourChild();
yc.yourChild();
yc.child();
yc.parent();

Child ch=new Child();
ch.child();
ch.parent();

Parent pt=new Parent();
pt.parent();

*/