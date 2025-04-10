import { LightningElement } from 'lwc';

export default class QuizAppSalesforce extends LightningElement {
    myQuestions=[
        {
            id:"Question1",
            question:"Which of the following is not a valid Salesforce object type?",
            answers:{
                a:"Standard Object",
                b:"Custom Object",
                c:"Third-Party Object",
                d:"External Object"
            },
            correctAnswer:"c"
        },
        {
            id:"Question2",
            question:"What is the default sharing model for most objects in Salesforce?",
            answers:{
                a:"Public Read Only",
                b:"Private",
                c:"Public Read/Write",
                d:"Controlled by Parent"
            },
            correctAnswer:"b"
        },
        {
            id:"Question3",
            question:"Which Salesforce automation tool should you use for a series of complex business processes that involve multiple steps?",
            answers:{
                a:"Process Builder",
                b:"Workflow Rule",
                c:"Flow Builder",
                d:"Approval Process"
            },
            correctAnswer:"c"
        },
        {
            id:"Question4",
            question:"Which of the following is used for querying records in Salesforce?",
            answers:{
                a:"DML",
                b:"Apex Trigger",
                c:"SOQL",
                d:"Batch Apex"
            },
            correctAnswer:"c"
        },
        {
            id:"Question5",
            question:"Which of the following is an Apex programming feature that allows asynchronous processing?",
            answers:{
                a:"@future annotation",
                b:"Visualforce page",
                c:"Batch Apex",
                d:"Queueable Apex"
            },
            correctAnswer:"a"
        }
    ]
    selected={}
    correctAnswers=0
    isSubmitted=false
    changeHandler(event){
        const{name,value}=event.target
        this.selected={...this.selected,[name]:value}
    }
    get allNotSelected(){
        return !(Object.keys(this.selected).length===this.myQuestions.length)
    }

    get isScoredFull(){
        return `slds-text-heading_large ${this.myQuestions.length===this.correctAnswers?
            'slds-text-color_success':'slds-text-color_error'}`
    }
    submitHandler(event){
        event.preventDefault()
        let correct=this.myQuestions.filter(item=>this.selected[item.id]===item.correctAnswer)
        this.correctAnswers=correct.length
        this.isSubmitted=true
    }
    resetHandler(event){
        this.selected=0
        this.correctAnswers=0
        this.isSubmitted=false
    }
}