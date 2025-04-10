import { LightningElement } from 'lwc';

export default class CalculateApp extends LightningElement {

    operation=''
    result=''

    handleShowData(event){
        const{operation,result}=event.detail;
        this.operation=operation;
        this.result=result;
    }
}