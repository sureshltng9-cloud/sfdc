import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/ContactManager.accList1';
import { updateRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

export default class LwcEditSaveRow extends LightningElement {
    col = [
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'Phone',editable:true},
        {label:'Industry',fieldName:'Industry',type:'text',editable:true}
    ];
    
    @track accounts;
    fieldItemValues =[];
    @wire(getAccounts)accs(result){
        this.accounts = result;
        if(result.error){
            this.accounts = undefined;
        }
    }
    saveHandler(event){
        this.fieldItemValues = event.detail.draftValues;
        const inputsItems = this.fieldItemValues.slice().map(draft =>{
            const fields = Object.assign({},draft);
            return {fields}
        });
        const promises = inputsItems.map(inputsItem => updateRecord(inputsItem));
        console.log('promises =======>'+promises);
        Promise.all(promises).then(res=>{
            console.log('res =======>'+JSON.stringify(res));
            this.dispatchEvent(
                new ShowToastEvent({
                    title : 'Success',
                    message : 'Successfully Updated',
                    variant : 'success'
                })
            );
            this.fieldItemValues = [];
            return this.refresh();
        }).catch(error=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title : 'Error',
                    message : 'Not Updated',
                    variant : 'error'
                })
            );
            }).finally(()=>{
        this.fieldItemValues = [];
    });
    }   
    async refresh(){
        await refreshApex(this.accounts);
    }
}