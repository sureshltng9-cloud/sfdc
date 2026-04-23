import { LightningElement } from 'lwc';
import getAllContacts from '@salesforce/apex/ContactManager.getContact2'
export default class ImperativeMethod extends LightningElement {
    contacts;
    noOfRec;
    numberHandler(event){
        this.noOfRec = event.target.value;
    }
    getContacts(){
        getAllContacts({numberOfContacts : this.noOfRec})
        .then(result=>{this.contacts = result})
        .catch(error=>{console.log('error Message ======>'+error.body.message)});
    }
    connectedCallback(){
        const v = 5;
        getAllContacts({numberOfContacts : v})
        .then(result=>{this.contacts = result})
        .catch(error=>{console.log('error Message ======>'+error.body.message)});
    }
    get responseRecivede(){
        if(this.contacts){
            return true;
        }
        else{
            return false;
        }
    }
}