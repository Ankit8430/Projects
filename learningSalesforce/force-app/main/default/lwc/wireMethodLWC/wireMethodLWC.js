import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';  // Import Apex method

export default class AccountList extends LightningElement {
        //Without Parameties
    /*@wire(getAccounts)
    accounts;*/
    /*With PArameteris
    selectedType=''
    @wire(getAccounts,{
        type:'$selectedType'
    })
    accounts*/
    /*Without
    accounts;
    error;

    connectedCallback() {
        this.fetchData();
    }

    fetchData() {
        console.log('Fetching accounts...');
        getAccounts()
            .then((result) => {
                console.log('Fetched result:', result); // Log result for debugging
                this.accounts = result;
                this.error = undefined;
            })
            .catch((error) => {
                console.error('Error:', error); // Log error for debugging
                this.accounts = undefined;
                this.error = `Error fetching accounts: ${error.body?.message || error.message || error}`;
            });
    }*/
   //With Parameters
   accounts;
   error;
   fetchData(){
    getAccounts({type:''})
    .then((result)=>{
        console.log('Result =>'+result);
        this.accounts=result;
        this.error=undefined;
    }).catch((error)=>{
        this.accounts=undefined;
        this.error=error;
    })
   }
}