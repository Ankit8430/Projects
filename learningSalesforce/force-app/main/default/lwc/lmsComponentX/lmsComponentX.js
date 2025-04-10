import { LightningElement,wire } from 'lwc';
import SAMPLEMC from '@salesforce/messageChannel/SampleMessageChannel__c'
import {subscribe,unsubscribe,MessageContext,APPLICATION_SCOPE} from 'lightning/messageService'
export default class LmsComponentX extends LightningElement {
    messageRecieved
    subscription

    @wire(MessageContext)
    context 

    // connectedCallback(){
    //     this.subscribeMessage()
    // }
    subscribeMessage(){
        this.subscription=subscribe(this.context,SAMPLEMC,(message)=>{this.handleMessage(message)},{scope:APPLICATION_SCOPE})
    }
    
    handleMessage(message){
        this.messageRecieved=message.lmsData.value?message.lmsData.value:"No Message Publish"
    }
    unsubscribeHandle(){
        unsubscribe(this.subscription)
        this.subscription=null
    }
}