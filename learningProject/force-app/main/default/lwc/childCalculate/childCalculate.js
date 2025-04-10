import { LightningElement } from 'lwc';

export default class ChildCalculate extends LightningElement {
    num1=''
    num2=''

    handleNumber1Change(event){
        this.num1=parseFloat(event.target.value);
    }
    handleNumber2Change(event){
        this.num2=parseFloat(event.target.value);
    }

    dispatchResult(operation,result){
        const event=new CustomEvent('calculate',{
            detail:{operation,result}
        });
        this.dispatchEvent(event);
    }

    handleAdd(){
        const result=this.num1 + this.num2;
        this.dispatchResult('Addition',result);
    }
    handleSubtract(){
        const result =this.num1 - this.num2;
        this.dispatchResult('Substract',result);
    }
    handleMultiply(){   
        const result= this.num1 * this.num2;
        this.dispatchResult('Multiply',result);
    }
    handleDivide(){ 
        const result= this.num2>0?this.num1/this.num2:'Connot divide by zero';
        this.dispatchResult('Divide',result);
    }
}