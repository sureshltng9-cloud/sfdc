import { LightningElement,wire } from 'lwc';
import { createRecord , getRecord } from 'lightning/uiRecordApi';
const fieldArry = ['Contact.LastName','Contact.Email','Contact.Phone'];
export default class CreatEditContactLWC extends LightningElement {
    contactLastName;
    contactEmail;
    contactPhone;
    recordId;
    @wire(getRecord,{recordId:'$recordId',fields:fieldArry}) contRecord;
    nameHandler(event){
        this.contactLastName = event.target.value;
    }
    emailHandler(event){
        this.contactEmail = event.target.value;
    }
    phoneHandler(event){
        this.contactPhone = event.target.value;
    }
    createContact(){
        const fields = {'LastName':this.contactLastName,'Email':this.contactEmail,'Phone':this.contactPhone};
        const con = {apiName:'Contact',fields};
        createRecord(con).then(response =>{
            console.log('Record is created successfully =======>'+response.id);
            console.log('Record is created successfully =======>'+JSON.stringify(response));
            this.recordId = response.id;
        }).catch(error =>{
            console.log('Error in creat contact ======>'+error.body.message);
        });
    }
    get conName(){
        if(this.contRecord.data){
            console.log('data ======>'+this.contRecord.data);
            return this.contRecord.data.fields.LastName.value;
        }
    }
    get conEmail(){
        if(this.contRecord.data){
            return this.contRecord.data.fields.Email.value;
        }
    }
    get conPhone(){
        if(this.contRecord.data){
            return this.contRecord.data.fields.Phone.value;
        }
    }
}