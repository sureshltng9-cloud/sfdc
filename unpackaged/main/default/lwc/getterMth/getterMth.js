import { LightningElement } from 'lwc';

export default class GetterMth extends LightningElement {
    height;
    weight;
    bmi;
    weightHandler(event){
        this.weight = parseFloat(event.target.value);
    }
    heightHandler(event){
        this.height = parseFloat(event.target.value);
    }
    calculateBmi(){
        try{
            this.bmi = this.weight/(this.height*this.height);
        }
        catch(error){
            this.bmi = undefined;
        }
    }
    get bmiValue(){
        if(this.bmi === undefined){
            return '';
        }
        return `Your BMI is : ${this.bmi}`
    }
}