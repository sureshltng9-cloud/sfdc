import { LightningElement,track,api,wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { createRecord,getRecord,updateRecord} from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';
import Contact_OBJECT from '@salesforce/schema/Contact';
import First_Name from '@salesforce/schema/Contact.FirstName';
import Last_Name from '@salesforce/schema/Contact.LastName'   
import Email_FIELD from '@salesforce/schema/Contact.Email';
import getContact from '@salesforce/apex/ContactManager.getContact2';

export default class Learn extends LightningElement {
    
    count = 6;
    @track cts = [];
    columns = [
        {label:'First Name',fieldName:'FirstName',type:'text',editable:true},
        {label:'Last Name',fieldName:'LastName',type:'text',editable:true},
        {label:'Email',fieldName:'Email',type:'email',editable:false}
    ];

    @track draftValues = [];
    

    @wire(getContact,{numberOfContacts:'$count'}) 
    conts(contacts){
        this.cts = contacts;
        if(contacts.error){
            console.log('============Wired Error Handler==========='+JSON.stringify(contacts.error.body));
            this.cts = [];
        }
    }
    saveHandler(event){
        this.draftValues = event.detail.draftValues;
        console.log('============Wired Draft Values==========='+JSON.stringify(this.draftValues));
        let records = this.draftValues.slice().map(drftv => {
            let fields = drftv;
            return {fields};
        });
        let promises = records.map(res => updateRecord(res));
        Promise.all(promises)
        .then(res =>{
           let msg = new ShowToastEvent({
                title : 'Record Update Message',
                message : 'Record Successfully Updated',
                variant : 'success'
           });  
           this.dispatchEvent(msg);
           this.draftValues = [];
           this.refresh();
        })
        .catch(error =>{
            console.log('=========Promise Error Handler========='+JSON.stringify(error));
        })
        .finally(() =>{
            this.draftValues = [];
        });
    }
    async refresh(){
        await refreshApex(this.cts);
    }

}