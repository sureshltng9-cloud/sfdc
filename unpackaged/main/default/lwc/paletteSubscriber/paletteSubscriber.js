import { LightningElement,wire,track } from 'lwc';
import {registerListener,unregisterAllListeners} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

export default class CanvasSubscriber extends LightningElement {
   color;
   @wire(CurrentPageReference) pageRef;
   connectedCallback(){
        registerListener("colorFired",this.clrHandle,this);
   }
   
   clrHandle(colorCode){
        this.color = colorCode;
        console.log('colorCode456=========>'+colorCode);
   }
   disconnectedCallback(){
    unregisterAllListeners(this);
   }
   get colorStyl(){
        console.log('`background-color:${this.color}` ======>'+this.color);
        return `background-color:${this.color}`;
   }
}