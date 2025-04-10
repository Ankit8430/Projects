import { LightningElement,wire} from 'lwc';
import filterAccountType from '@salesforce/apex/AccountController.filterAccountType'
export default class WireApexWithParams extends LightningElement {

    selectedType=''
    accountList
    @wire(filterAccountType,{type:'$selectedType'})
    accountHandler({data,error}){
        if(data){
            console.log(data)
            this.accountList=data
        }
        if(error){
            console.error(error)
        }
    }

    @wire(filterAccountType,{type:'$selectedType'})
    accountListProperty
    
    get typeOptions(){
        return[
            {label:"Customer - Direct",value:"Customer - Direct"},
            {label:"Customer - Channel",value:"Customer - Channel"}
        ]
    }
    typeHandler(event){
        this.selectedType=event.target.value
    }
}