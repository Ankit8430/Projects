import { LightningElement,track} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class EmployeeData extends LightningElement {
    @track employee={
        name:'',
        age:'',
        email:'',
        ctc:''
    }
    @track employeeList=[]

    columns=[
        {label:'Name',fieldName:'name',type:'text'},
        {label:'Age',fieldName:'age',type:'number'},
        {label:'Email',fieldName:'email',type:'email'},
        {label:'CTC',fieldName:'ctc',type:'number'}
    ]
    get isSaveDisabled(){
        const{name,email,age,ctc}=this.employee;
        return !(name && email && age && ctc);
    }
    handleChange(event){
        const field=event.target.name;
        this.employee[field]=event.target.value;
    }
    handleSave(){
        this.employeeList=[...this.employeeList,{...this.employee}];
        this.employee={
            name:'',
            age:'',
            email:'',
            ctc:''
        }
        this.showToast('Sucess','Employee Added Successfully','success');
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