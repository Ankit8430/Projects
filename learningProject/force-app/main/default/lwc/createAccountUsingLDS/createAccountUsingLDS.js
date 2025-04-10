import { LightningElement,track} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {createRecord} from 'lightning/uiRecordApi';
import {NavigationMinix} from 'lightning/navigation'
export default class CreateAccountUsingLDS extends NavigatiomMinix(LightningElement) {

   @track accountName='';
   @track accountPhone='';
   @track accountAnnualRevenue='';


    showToast(title,message,variant){
        const event=new ShowToastEvent({
            title,
            message,
            variant
        });
        this.dispatchEvent(event);
    }
    navigateToRecord(recordId){
        this[NavigationMinix.navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:recordId,
                objectApiName:'Account',
                actionName:'view'
            }
        })
    }
}