import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CurrencyLwc extends LightningElement {
    currencyOptions = [];
    fromCurrency;
    toCurrency;

    connectedCallback() {
        this.symbolFunc(); // Correct method call
    }

    async symbolFunc() {
        try {    
            const response = await fetch('https://api.frankfurter.app/currencies');
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            this.currencyOptions = Object.keys(data).map(currencyCode => {
                return {
                    label: data[currencyCode],
                    value: currencyCode
                };
            });
        } catch (error) {
            this.dispatchEvent(new ShowToastEvent({
                title: 'Error',
                message: 'Error fetching currencies: ' + error.message,
                variant: 'error'
            }));
        }
    }

    handleInputChange(event) {
        const { name, value } = event.target;
        if (name === 'fromCurrency') {
            this.fromCurrency = value;
        } else if (name === 'toCurrency') {
            this.toCurrency = value;
        }
    }
}
