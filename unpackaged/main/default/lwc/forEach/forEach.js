import { LightningElement } from 'lwc';

export default class ForEach extends LightningElement {
    contacts = [
        {id:1,name:"Vivekananda",age:23,},
        {id:2,name:"Kalam",age:21,},
        {id:3,name:"Tendulkar",age:18,}
    ];
}