import { LightningElement } from 'lwc';
import LightningPrompt from 'lightning/prompt';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class LightningPoput extends LightningElement {

    handleClick(){
        LightningPrompt.open({
            message:'Please enter your feedback:',
            label:'Feedback',
            defaultValue:'',
            placeholder:'Type your feedback here...',
        }).then((result)=>{
            this.showToast('Success!','User entered: '+result,'success');
        }).catch((error)=>{
            this.showToast('Error!',error.message,'error');
        })
    }

    showToast(title,message,variant){
        const event=new ShowToastEvent({
            title,
            message,
            variant
        });
        this.dispatchEvent(event);
    }
}