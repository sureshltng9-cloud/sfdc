import { LightningElement } from 'lwc';

export default class DeclarativeParent extends LightningElement {
    msg;
    handleCustomEvent(event){
        this.msg = event.detail;
    }
}