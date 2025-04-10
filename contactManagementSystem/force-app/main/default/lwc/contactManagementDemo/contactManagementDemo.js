import { LightningElement,wire} from 'lwc';
import getContacts from '@salesforce/apex/DemoContactControllerClass.getContacts';
import deleteContact from '@salesforce/apex/DemoContactControllerClass.deleteContact';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import deleteBulkContactData from '@salesforce/apex/DemoContactControllerClass.deleteBulkContactData';
import {refreshApex} from '@salesforce/apex';
export default class ContactManagementDemo extends LightningElement {

    columns=[
        {label:'First Name',fieldName:'FirstName'},
        {label:'Last Name',fieldName:'LastName'},
        {label:'Title',fieldName:'Title'},
        {label:'Phone',fieldName:'Phone'},
        {label:'Account Name',fieldName:'AccountUrl',type:'url',
            typeAttributes:{label:{fieldName:'AccountName'},target:'_blank'}
        },
        {label:'Email',fieldName:'Email',type:'email'},
        {
            type:'action',
            typeAttributes:{rowActions:this.getRowActions},
        },
    ]
    searchKey='';
    contacts=[];
    error;
    selectedContacts=[];
    isModalOpen=false;
    isCreateModal=false;
    IdToEditRecord;
    wiredContactResult;
    @wire(getContacts,{
        searchKeyword:'$searchKey'
    })
    contactHandler(result){
        this.wiredContactResult=result;
        const {data,error}=result;
        if(data){
            console.log(data);
            this.contacts=data.map(contact=>{
                let flatContact={...contact};
                flatContact.AccountName=contact.Account.Name;
                flatContact.AccountUrl=`/lightning/r/Account/${contact.AccountId}/view`;
                return flatContact;
            });
        }if(error){
            this.error=error;
            console.error(error)
        }
    }

    getRowActions(row,doneCallback){
        const actions=[
            {label:'Edit',name:'edit'},
            {label:'Delete',name:'delete'}
        ];
        doneCallback(actions);
    }

    handleRowAction(event){
        const action=event.detail.action;
        const rowId=event.detail.row.Id;

        switch(action.name){
            case 'edit':
                this.editRecord(rowId)
                break;
            case 'delete':
                this.deleteRecord(rowId);
                break;
            default:
                break;
        }
    }
    deleteRecord(rowId){
        deleteContact({contactId:rowId})
        .then(()=>{
            this.showToast('Success!!','Contact Deleted Successfully','success');
            this.refreshData();
        }).catch(error=>{
            this.showToast('Error!!',error.body.message,'error');
        })
    }
    editRecord(rowId){
        this.isModalOpen=true;
        this.IdToEditRecord=rowId;
    }
    showToast(title,message,variant){
        const event=new ShowToastEvent({
            title,
            message,
            variant
        })
        this.dispatchEvent(event);
    }
    successHandler(event){
        this.showToast('Success!!','Contact Updated Successfully','success');
        this.isModalOpen=false;
        this.refreshData();
    }
    closeModal(){
        this.isModalOpen=false;
    }

    refreshData(){
        return this.wiredContactResult? refreshApex(this.wiredContactResult):undefined;
    }

    handleSearch(event){
        this.searchKey=event.target.value;
    }
    handleContactCreate(event){
        this.isCreateModal=true;
        this.IdToEditRecord=null;
    }
    handleCreateContact(event){
        this.showToast('Success!!',"Record Id :"+event.detail.id,'success');
        this.isCreateModal=false;
        this.refreshData();
    }
    closeCreateModal(){
        this.isCreateModal=false;
    }
    handleBulkDelete(){
        if(this.selectedContacts.length==0){
            this.showToast('Warning!!','Please select atLeast one row','warring');
        }else{
            const contactIds=Array.from(this.selectedContacts).map(row=>row.Id);
            deleteBulkContactData({
                listContactIds:contactIds
            }).then(()=>{
                this.showToast('Success!!','Contacts Deleted Successfully','success');
                this.refreshData();
            }).catch(error=>{
                this.showToast('Error',error.body.message,'error');
            })
        }
    }
    handleBulkSelection(event){
        const allselectedRows=event.detail.selectedRows;
        this.selectedContacts=allselectedRows;
     }
}
