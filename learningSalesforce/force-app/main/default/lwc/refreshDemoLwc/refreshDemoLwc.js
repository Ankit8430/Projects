import { LightningElement,wire } from 'lwc';
import {updateRecord} from 'lightning/uiRecordApi'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import getContactList from '@salesforce/apex/RefreshContactController.getContactList'
import {refreshApex} from '@salesforce/apex'
const cols=[
    {label:'Id',fieldName:'Id'},
    {label:'First Name',fieldName:'FirstName',editable:true},
    {label:'Last Name',fieldName:'LastName',editable:true},
    {label:'Email',fieldName:'Email',type:'email'}
]
export default class RefreshDemoLwc extends LightningElement {

    columns=cols
    draftValues=[]
    
    @wire(getContactList)
    contacts
    /* getContactListHandler({data,error}){
    //     if(data){
    //         console.log(data)
    //         this.contacts=data
    //     }
    //     if(error){
    //         console.error(error)
    //     }
    // }*/

    handleSave(event){
        console.log(event.detail.draftValues)
        const recordInputs=event.detail.draftValues.slice().map(draft=>{
            const fields=Object.assign({},draft)
            return {fields:fields}
        })
        console.log("recordInputs",recordInputs)
        const promises=recordInputs.map(recordInput=>updateRecord(recordInput))
        Promise.all(promises).then(result=>{
            this.showToast('Success!!','Contact Updated Successfully','success')
            this.draftValues=[]
            return refreshApex(this.contacts)
        }).catch(error=>{
            this.showToast('Error!!',error.body.message,'error')
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