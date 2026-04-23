import { LightningElement,api } from 'lwc';
export default class Flow2WComp extends LightningElement {
    @api datFromFlow;
    columns =[{label:"First Name",fieldName:"FirstName"},{label:"Email",fieldName:"Email"}];
    @api input2Flow = "Message From Lighntning Data Table";
}