import { LightningElement, track } from 'lwc';
import insertAccounts from '@salesforce/apex/FileUploader.insertAccounts';
import getCSV from '@salesforce/apex/loadFromFTP.getCSV';

export default class DataUploader extends LightningElement {
    @track columns = [];
    @track data = [];
    @track isTableVisible = false;
    @track isProcessing = false;
    message;
    csvData;
    errorFromFTP;
    errorNoFileName;

    handleButtonClick() {
        try {
            const inputElement = this.template.querySelector('[data-id="file-input"]');
            const fileName = inputElement.value;
            if (!fileName) {
                throw new Error('No file name entered');
            }
            this.isProcessing = true;
            this.handleFTPUpload(fileName);
        } catch (error) {
            this.errorNoFileName = error.message;
        }
    }

    async handleFTPUpload(fileName) {
        try {
            this.errorFromFTP = null;
            this.csvData = await getCSV({ csvName: fileName });
            this.parseCSV(this.csvData);
        } catch (error) {
            this.errorFromFTP = error.body ? error.body.message : error.message;
        } finally {
            this.isProcessing = false;
        }
    }

    parseCSV(csv) {
        const lines = csv.split(/\r\n|\n/);
        const headers = lines[0].split(',');

        this.columns = headers.map((header) => ({
            label: header,
            fieldName: header
        }));

        const data = [];
        for (let i = 1; i < lines.length; i++) {
            const line = lines[i];
            if (!line.trim()) continue; // Skip empty lines
            const row = {};
            const currentline = line.split(',');
            headers.forEach((header, index) => {
                row[header] = currentline[index];
            });
            data.push(row);
        }

        if (data.length === 0) {
            throw new Error('No data in file');
        }

        this.data = data;
        this.isTableVisible = true;
    }

    handleUpload() {
        this.isProcessing = true;
        insertAccounts({ data: this.data })
            .then((result) => {
                this.message = result;
                this.errorFromFTP = null;
                this.data = [];
                this.isTableVisible = false;
            })
            .catch((error) => {
                this.errorFromFTP = error.body ? error.body.message : error.message;
            })
            .finally(() => {
                this.isProcessing = false;
            });
    }
}