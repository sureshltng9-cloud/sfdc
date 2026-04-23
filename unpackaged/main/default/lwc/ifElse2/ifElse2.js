import { LightningElement } from 'lwc';

export default class IfElse2 extends LightningElement {
    check = true;
    name;
    age;
    salary;
    
    nameHandler(event){
        this.name = event.target.value;
    }
    ageHandler(event){
        this.age = event.target.value;
    }
    salaryHandler(event){
        this.salary = event.target.value;
    }
    save(){
        this.check = false;
    }
}