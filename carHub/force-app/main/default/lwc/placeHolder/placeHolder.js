import { LightningElement, api } from 'lwc';
/*static resource*/
import CAR_HUB_PLACEHOLDER from '@salesforce/resourceUrl/carhub_images'
export default class PlaceHolder extends LightningElement {
    @api message

    placeholderUrl = CAR_HUB_PLACEHOLDER
}