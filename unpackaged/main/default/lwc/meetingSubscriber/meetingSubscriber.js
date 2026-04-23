import { LightningElement,wire,track } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { registerListener,unregisterAllListeners } from 'c/pubsub';

export default class MeetingSubscriber extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    @track roomInfo = {};
    connectedCallback(){
        registerListener("roomData",this.roomHandler,this);
    }
    roomHandler(payload){
        this.roomInfo = payload;
        console.log('payload this.roomInfo=======>'+JSON.stringify(this.roomInfo));
    }
    disconnectedCallback(){
        unregisterAllListeners(this);
        console.log('unregisterAllListeners========>');
    }
}