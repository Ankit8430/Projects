import { LightningElement,track } from 'lwc';

export default class HelloWorld extends LightningElement {
   
    // Getter
    // Example 1
    users=["Ankit","Aman","Naman"]
    get firstUser(){
        return this.users[0]
    }
    // Example 2
    num1=10
    num2=20
    get sumOfNum(){
        return this.num1+this.num2
    }
   /*track Properties
   @track 
   address={
    city:"Firozabad",
    postcode:283203,
    country:"India"
   }
   trackHandler(event){
    this.address.city=event.target.value
   }*/
    /* fullname="Zero to Hero LWC"
    title="Salesforce Developer"
    //Two way Data Binding in a Template
    changeHadler(event){
        this.title=event.target.value
    }   */
    /* ***Local Properties
    name//undefined
    age=30
    fullname="Salesforce Developer"
    showData=true
    details={
        name:"dummy",
        place:"Firozabad"
    }
    userList=["A","B","C"]*/
}