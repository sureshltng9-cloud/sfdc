import { LightningElement } from 'lwc';

export default class SimpleInterest extends LightningElement {
    amount;
    rate;
    years;
    //track result = 'result here';
    result = 'result here';

    amountHandler(event){
        this.amount = event.target.value;
    }
    rateHandler(event){
        this.rate = event.target.value;
    }
    yearHandler(event){
        this.years = event.target.value;
    }
    calculateHandler(){
        this.result = 'Simple Interest Result is :'+ (this.amount*this.rate*this.years)/100 ;
        console.log('result========='+this.result);
    }
}