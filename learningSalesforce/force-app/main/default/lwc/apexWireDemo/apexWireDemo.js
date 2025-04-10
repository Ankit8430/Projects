import { LightningElement,wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList'
export default class ApexWireDemo extends LightningElement {
    accounts
    @wire(getAccountList)
    accountHandler({data,error}){
        if(data){
            console.log(data)
            this.accounts=data
        }
        if(error){
            console.error(error)
        }
    }


    @wire(getAccountList)
    accountProperty
}