import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class ShowToastExmp extends LightningElement {
    successHandler(){
        console.log('======>'+'success');
        const successMsg = new ShowToastEvent({
            title : "Success",
            message : "This is success message",
            variant : "success",
        });
        this.dispatchEvent(successMsg);
    }
    errorHandler(){
        console.log('======>'+'error');
        const errorMsg = new ShowToastEvent({
            title : "Error",
            message : "This is error message",
            variant : "error",
        });
        this.dispatchEvent(errorMsg);
    }
    warningHandler(){
        console.log('======>'+'warning');
        const warningMsg = new ShowToastEvent({
            title : "Warning",
            message : "This is warning message",
            variant : "warning",
        });
        this.dispatchEvent(warningMsg);
    }
    infoHandler(){
        console.log('======>'+'info');
        const infoMsg = new ShowToastEvent({
            title : "Info",
            message : "This is info message",
            variant : "info",
        });
        this.dispatchEvent(infoMsg);
    }
}