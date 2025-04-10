import { LightningElement } from 'lwc';

export default class ModalWrapper extends LightningElement {
    isOpen=false
    opentHandler(){
        console.log('Clicked!!')
        this.isOpen=true
    }
}