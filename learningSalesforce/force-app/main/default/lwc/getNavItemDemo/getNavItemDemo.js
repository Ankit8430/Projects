import { LightningElement,wire } from 'lwc';
import {getNavItems} from 'lightning/uiAppsApi'
export default class GetNavItemDemo extends LightningElement {
    result
    @wire(getNavItems,{
        navItemNames:['standard-Account'],
        pageSize:30
    })
    navItemHanlder({data,error}){
        if(data){
            console.log(data)
            this.result=data.navItems[0]
        }
        if(error){
            console.error(error)
        }
    }
}