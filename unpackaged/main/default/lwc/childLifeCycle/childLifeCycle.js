import { LightningElement } from 'lwc';

export default class ChildLifeCycle extends LightningElement {
    constructor(){
        super();
        console.log('Child constructor is called');
    }
    connectedCallback(){
        console.log('Child connectedcallback is called');
    }
    renderedCallback(){
        console.log('Child renderedcallback is called');
    }
    disconnectedCallback(){
        console.log('Child disconnectedcallback is called');
    }
}