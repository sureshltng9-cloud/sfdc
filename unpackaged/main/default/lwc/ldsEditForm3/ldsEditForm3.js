import { LightningElement } from 'lwc';

export default class LdsEditForm3 extends LightningElement {
    recordId;
    createCon(event){
        this.recordId = event.detail.id;
    }
}