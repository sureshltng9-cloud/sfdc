import { LightningElement,wire} from 'lwc';
import {fireEvent} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';


export default class PalettePublisher extends LightningElement {
    @wire(CurrentPageReference) pageRef;
    color;
    colorOpotions =[
        {label:"Red Color",value:"red"},
        {label:"Red Green",value:"green"},
        {label:"Yellow Color",value:"yellow"}
    ];
    colorHandler(event){
        this.color = event.target.value;
        console.log('color handler======>');
    }
    colorChangeHandler(){
        //fireEvent(this.pageRef,"colorFired",this.color);
        fireEvent(this.pageRef,"colorFired",this.color);
        //console.log('fireEvent======>'+this.color);
    }
}