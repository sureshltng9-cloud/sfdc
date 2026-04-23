import { LightningElement } from 'lwc';

export default class ShapeCalculator extends LightningElement {
    height;
    width;
    side;
    diagonal1;
    diagonal2;
    result;
    
    sideChangeHandler(event){
        this.side = event.target.value;
    }
    widthChangeHandler(event){
        this.width = event.target.value;
    }
    heightChangeHandler(event){
        this.height = event.target.value;
    }
    diagonal1ChangeHandler(event){
        this.diagonal1 = event.target.value;
    }
    diagonal2ChangeHandler(event){
        this.diagonal2 = event.target.value;
    }
    calculateSquareHandler(){
        const s = parseInt(this.side);
        this.result = 'Area of The Square is :'+ (s*s);
    }
    calculateRectangularHandler(){
        const w = parseInt(this.width);
        const h = parseInt(this.height);
        this.result = 'Area of The Rectangular is :'+ (w*h);
    }
    calculateRhHandler(){
        const d1 = parseInt(this.diagonal1);
        const d2 = parseInt(this.diagonal2);
        this.result = 'Area of The Rhombus is :'+ (d1*d2)/2;
    }
}