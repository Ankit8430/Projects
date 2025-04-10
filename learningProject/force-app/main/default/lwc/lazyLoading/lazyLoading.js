import { LightningElement } from 'lwc';
import getAccountRecords from '@salesforce/apex/LazyLoadingController.getAccountRecords'
import getAccountRecordOnLoadMore from '@salesforce/apex/LazyLoadingController.getAccountRecordOnLoadMore';
const columns=[
    {label:'Name',fieldName:'Name'},
    {label:'Industry',fieldName:'Industry'},
    {label:'Rating',fieldName:'Rating'}
];
export default class LazyLoading extends LightningElement {
    columns=columns;
    accData=[];
    error;

    async onLoadData(){
        try{
            this.accData=await getAccountRecords();
        }catch(err){
            console.log('Error While Loading the data'+er);
        }
    }

    async LoadMoreData(event){
        try{
            const {target}=event
            target.isLoading=true;
            let currentRec=this.accData;
            let lastRecord=currentRec[currentRec.length-1];
            let newRec=await getAccountRecordOnLoadMore({
                lastId: lastRecord.Id
            });
            this.accData=[...currentRec,...newRec];
            target.isLoading=false;
        }catch(e){
            console.log('Error in load more'+e);
        }
    }
}