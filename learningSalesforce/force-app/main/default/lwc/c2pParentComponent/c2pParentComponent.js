import { LightningElement } from 'lwc';

export default class C2pParentComponent extends LightningElement {
    showModal=false
    msg
    clickHandler(){
        this.showModal=true
    }

    closeHander(event){
        this.msg=event.detail.msg
        this.showModal=false
    }
}