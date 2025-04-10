import { LightningElement } from 'lwc';

export default class LifeCycleChild extends LightningElement {
    constructor(){
        super()
        console.log('Child Constructor')
    }
    connectedCallback(){
        console.log('Child Connected Call back')
        throw new Error('Loading of child component failed')
    }
    renderedCallback(){
        console.log('Child Rendered Call back')
    }
    disconnectedCallback(){
        alert('Child Disconnected Call back Called!!')
    }
}