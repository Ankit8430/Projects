import { LightningElement } from 'lwc';

export default class HelloQuerySelector extends LightningElement {
    userNames=["Ankit","Aman","Naman","Shivani"]

    fetchDetails(){
        const userElements=this.template.querySelectorAll('.name')
        Array.from(userElements).forEach(item=>{
            console.log(item.innerText)
        })
    }
}