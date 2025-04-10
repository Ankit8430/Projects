import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigateToNavItemPage extends NavigationMixin(LightningElement){

    navigateToNavItem(){
        this[NavigationMixin.Navigate]({
            type:'standard__navItemPage',
            attributes:{
                apiName:'Styling_in_LWC'
            }
        })
    }
}