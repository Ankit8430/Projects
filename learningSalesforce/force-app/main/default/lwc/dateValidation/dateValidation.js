import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class DateValidation extends LightningElement {
    startDate
    endDate
    dateHandler(event){
        const{name,value}=event.target
        this[name]=value
    }
    submitHandler(){
        if(!this.validateDate(this.startDate,this.endDate)){
            this.showToast('Error','Start Date should be less than End Date','error')
        }else{
            this.showToast('Success','Date is Valid','success')
        }

    }
    validateDate(startDate,endDate){
        return new Date(startDate).getTime()<new Date(endDate).getTime()
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