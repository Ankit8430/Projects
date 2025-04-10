import { LightningElement } from 'lwc';
import {createRecord} from 'lightning/uiRecordApi'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import CONTACT_OBJECT from '@salesforce/schema/Contact'
export default class CreateRecordDemo extends LightningElement {
   formFields={}

    changeHandler(event){
        const {name,value}=event.target
        this.formFields[name]=value
    }
    createContact(){
        const recordInput={apiName:CONTACT_OBJECT.objectApiName,fields:this.formFields}
        createRecord(recordInput).then(result=>{
            this.showToast('Success!!',`Contact Created with ${result.id}`,'success')
            this.template.querySelector('form.createForm').reset()
            this.formFields={}
        }).catch(error=>{
            this.showToast('Error !!',error.body.message,'error')
        })
    }
    showToast(title,message,variant){
        const event=new ShowToastEvent({
            title,
            message,
            variant
        })
        this.dispatchEvent(event)
    }
}