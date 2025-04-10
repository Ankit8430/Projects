import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/Navigation'
export default class NavigateToRelatedRelationship extends NavigationMixin(LightningElement) {

    nvaigationToRelatedList(){
        this[NavigationMixin.Navigation]({
            type:'standard__recordRelationshipPage',
            attributes:{
                recordId:'001WU00000LIJzxYAH',
                objectApiName:'Account',
                relationshipApiName:'Contacts',
                actionName:'view'
            }
        })
    }
}