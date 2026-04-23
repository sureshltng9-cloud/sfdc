import { LightningElement } from 'lwc';

export default class PublicMethodParent extends LightningElement {
    value;
    onchangeHandler(event){
        this.value = event.target.value;
    }
    checkBoxSelectHandler(){
        let component = this.template.querySelector('c-public-method-child');
        let res = component.checkBoxChecked(this.value);
        console.log('result========>'+res);
    }
}