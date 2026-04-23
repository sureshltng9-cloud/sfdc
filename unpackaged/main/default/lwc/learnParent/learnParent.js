import { LightningElement,wire } from 'lwc';
//import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { registerListener,unregisterAllListeners } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

export default class LearnParent extends LightningElement {
    parameter = 'Welcome Message';
    @wire(CurrentPageReference) pageRef;
    connectedCallback(){
        registerListener('passMessage2Cmp',this.manageHandler,this);
    }
    manageHandler(pld){
        this.parameter = pld;
    }
    disconnectedCallback(){
        unregisterAllListeners(this);
    }
}