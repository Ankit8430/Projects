import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class Notifications extends LightningElement {

    successHandler(){
            this.showToast('Success!!','{0} Account Created!!{1}','success')
    }
    errorHandler(){
            this.showToast('Error!','Account Creation Failed!!','error')
    }
    warningHandler(){
        this.showToast('Warning!!','Password should have 15 characters!!','warning')
    }
    infoHandler(){
        this.showToast('Info!!','I am Ankit Gupta','info')
    }
    showToast(title,message,variant){
        const evt=new ShowToastEvent({
            title,
            message,
            variant,
            messageData:[
                'Salesforce',{
                    url:'https://www.salesforce.com/',
                    label:'Click Here'
                }
            ],
            mode:'sticky'
        });
        this.dispatchEvent(evt)
    }
}