import { LightningElement,wire } from 'lwc';
import getAllcontacts from '@salesforce/apex/ContactManager.getContact';
export default class WireProperty extends LightningElement {
    @wire(getAllcontacts)contacts;
    get responseRecived(){
        if(this.contacts){
            console.log('=====>'+'true');
            return true;
        }else{
            console.log('=====>'+'false');
            return false;
        }
    }
}