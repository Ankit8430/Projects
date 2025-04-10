import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class RecordEditCustom extends LightningElement {
    objectName=ACCOUNT_OBJECT

    inputValue=''
    handleChange(event){
        this.inputValue=event.target.value
    }
    handleSubmit(event){
        event.preventDefault()
        const inputCmp=this.template.querySelector('lightning-input')
        const value=inputCmp.value
        if(!(value.includes('India'))){
            inputCmp.setCustomValidity("The Account name must include India")
        }else{
            inputCmp.setCustomValidity("")
            const fields=event.detail.fields
            fields.Name=this.inputValue
            this.template.querySelector('lightning-record-edit-form').submit(fields)
        }
        inputCmp.reportValidity()
    }

    successHandler(event){
        const newEvent=new ShowToastEvent({
            title:'Account Created',
            message:"Record Id :"+event.details.id,
            variant:"success"
        })
        this.dispatchEvent(newEvent)
    }
}