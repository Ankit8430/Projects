import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    constructor(){
        super()
        console.log('Parent Constructor')
    }
    connectedCallback(){
        console.log('Parent Connected Callback')
    }
    renderedCallback(){
        console.log('Parent Rendered Callback')
    }
    isChildVisible=false
    handleChange(){
        this.isChildVisible=!this.isChildVisible
    }
    errorCallback(error,stack){
        console.log(error.message)
        console.log(stack)
    }
}