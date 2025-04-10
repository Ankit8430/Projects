import { LightningElement,wire } from 'lwc';
import {getPicklistValues,getObjectInfo} from 'lightning/uiObjectInfoApi'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
export default class GetPicklistValueDemo extends LightningElement {

    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectInfo

    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',fieldApiName:INDUSTRY_FIELD})
    industryPicklist({data,error}){
        if(data){
            console.log(data)
        }
        if(error){
            console.error(error)
        }
    }
}