import { LightningElement,wire } from 'lwc';
import getContactsList from '@salesforce/apex/ContactController1.getContactsList'
export default class FilteringAndSortingDemo extends LightningElement {
    headings=["Id","Name","Title","Email"]
    fullTableData=[]
    filteredData=[]
    Filter
    timer
    filterBy="Name"
    sortedby='Name'
    sortDirection='asc'
    @wire(getContactsList)
    contactHandler({data,error}){
        if(data){
            console.log(data)
            this.fullTableData=data
            this.filteredData=[...this.sortBy(data)]
        }
        if(error){
            console.error(error)
        }
    }

    get FilterByOptions(){
        return[
            {label:"All",value:'All'},
            {label:"Id",value:'Id'},
            {label:"Name",value:'Name'},
            {label:"Title",value:'Title'},
            {label:"Email",value:'Email'}
        ]
    }

    get sortByOptions(){
        return[
            {label:"Id",value:'Id'},
            {label:"Name",value:'Name'},
            {label:"Title",value:'Title'},
            {label:"Email",value:'Email'}
        ]
    }

    filterByHandler(event){
        this.filterBy=event.target.value
    }
    filterHandler(event){
        const{value}=event.target
        window.clearTimeout(this.timer)
        if(value){
            this.timer=window.setTimeout(()=>{
                console.log(value)
                this.filteredData=this.fullTableData.filter(eachObj=>{
                    if(this.filterBy==='All'){
                        // Object.keys(eachObj)=["Id","Name","Title","Email"]
                        /* Belo logic will filter each and every property of object*/
                        return Object.keys(eachObj).some(key=>{
                            return eachObj[key].toLowerCase().includes(value)
                        })
                    }else{
                        /* Below logic will filter only selected fields*/
                        const val=eachObj[this.filterBy]?eachObj[this.filterBy]:''
                        return val.toLowerCase().includes(value)
                    }
                })
            },1000)
        }else{
            this.filteredData=[...this.fullTableData]
        }
    }
    /* Sorting Logic */
    sortHandler(event){
        this.sortedby=event.target.value
        this.filteredData=[...this.sortBy(this.filteredData)]
    }

    sortBy(data){
        const cloneData=[...data]
        cloneData.sort((a,b)=>{
            if(a[this.sortedby]===b[this.sortedby]){
                return 0
            }
            return this.sortDirection==='desc'?
            a[this.sortedby]>b[this.sortedby]? -1:1:
            a[this.sortedby]<b[this.sortedby]?-1:1
        })
        return cloneData
    }
}
