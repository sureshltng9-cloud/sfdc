import { LightningElement,track } from 'lwc';

export default class EmployeeDetails extends LightningElement {
    @track name;
    @track age;
    @track designation;
    nameHandler(event){
        this.name = event.target.value;
    }
    ageHandler(event){
        this.age = event.target.value;
    }
    desgHandler(event){
        this.designation = event.target.value;
    }
}