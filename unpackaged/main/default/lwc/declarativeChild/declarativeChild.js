import { LightningElement } from 'lwc';

export default class DeclativeChild extends LightningElement {
    changeHandler(event){
        const name = event.target.value;
        const passEvnt = new CustomEvent('mycustomevent',{detail:name});
        this.dispatchEvent(passEvnt);
    }
}