import { LightningElement,wire,api,track } from 'lwc';
import ShowToastEvent from 'lightning/platformShowToastEvent';
import {CurrentPageReference} from 'lightning/navigation';
import { registerListener,unregisterAllListeners } from 'c/pubsub';
import getContact2 from '@salesforce/apex/ContactManager.getContact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import { updateRecord } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';

export default class T1ParentEmployee extends LightningElement {

   col = [
    {label:"First Name",fieldName:"FirstName",type:"text",editable:true},
    {label:"Last Name",fieldName:"LastName",type:"text",editable:true},
    {label:"Phone",fieldName:"Phone",type:"phone",editable:true}
   ];
    draftValues = [];
    @track contacts;
    check = false;
    tt = 'check';
    // connectedCallback(){
    //     this.conHandler();
    // }
    // conHandler(){
    //     getContact2()
    //     .then(result => {
    //         if(result){
    //             this.check = true;
    //         }
    //         this.contacts = result;
    //         console.log('handler===========>'+JSON.stringify(this.contacts));
    //     })
    //     .catch(error => {
    //         this.check = false;
    //         console.log('error==============>'+JSON.stringify(error.body));
    //     });
    //}
    @wire(getContact2)conList(result){
        this.contacts = result;
        if(result.error){
            this.contacts = undefined;
            console.log('Errors in wire function========>'+JSON.stringify(result.error.body));
        }else if(result.data){
            console.log('data============'+JSON.stringify(result.data));
            console.log('++++++'+`this is ${this.tt}`);
            console.log('++++++'+`this is "$this.tt"`);
        }
    }
    handleSavewe(event){
        this.draftValues = event.detail.draftValues;
        console.log('draftValues=========>'+JSON.stringify(this.draftValues));
        let inputs = this.draftValues.slice().map(r => {
            let fields = Object.assign({},r);
            return {fields}
        });
        console.log('inputs=========>'+JSON.stringify(inputs));
        let promises = inputs.map(s => updateRecord(s));
        Promise.all(promises).then(result => {alert('success');
          this.draftValues = []; 
          this.refresh(); })
        .catch(error => {alert('error');})
        .finally(()=>{
            this.draftValues = [];
            alert('finnaly is executed');
        });
    }
    async refresh(){
        await refreshApex(this.contacts);
    }

}