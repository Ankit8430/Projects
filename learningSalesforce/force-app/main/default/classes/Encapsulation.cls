public class Encapsulation {
	private string name;
    private integer age;
    public void setNameAndAge(String name,Integer age){
        this.name=name;
        this.age=age;
    }
    public void getNameAndAge(){
        System.debug('Name => '+this.name+' Age => '+this.age);
    }
}