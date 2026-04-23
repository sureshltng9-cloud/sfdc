import { LightningElement } from 'lwc';
import getAccount from '@salesforce/apex/ContactManager.accList'

export default class SldsDataTable extends LightningElement {
    accounts = [];

    connectedCallback(){
        getAccount().then(result => {
            this.accounts = result;
            console.log('==========>'+result);
        })
        .catch(error =>{ console.log(error.body.message)});
    }
}