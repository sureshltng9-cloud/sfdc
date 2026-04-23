import { LightningElement } from 'lwc';

export default class ParentLifeCycle extends LightningElement {
    constructor(){
        super();
        console.log('Parent constructor is called');
    }
    connectedCallback(){
        console.log('Parent connectedcallback is called');
    }
    renderedCallback(){
        console.log('Parent renderedcallback is called');
    }
    disconnectedCallback(){
        console.log('Parent disconnectedcallback is called');
    }
}