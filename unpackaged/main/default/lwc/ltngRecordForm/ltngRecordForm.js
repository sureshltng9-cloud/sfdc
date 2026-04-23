import { LightningElement,api } from 'lwc';

export default class LtngRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;
}