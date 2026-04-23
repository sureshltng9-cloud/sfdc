import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    greetings = 'Hello World';

    nameHandler(event){
        this.greetings = event.target.value;
        console.log('Event=====>'+JSON.stringify(event));
        console.log('Event target=====>'+JSON.stringify(event.target));
    }
}