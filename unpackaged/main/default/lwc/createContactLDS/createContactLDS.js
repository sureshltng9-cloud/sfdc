import { LightningElement } from 'lwc';
import {createRecord} from 'lightning/uiRecordApi'
export default class CreateContactLDS extends LightningElement {
    contactLastName;
    contactPhone;
    contcatEmail;
    nameChangeHandler(event){
        this.contactLastName = event.target.value;
    }
    emailChangeHandler(event){
        this.contcatEmail = event.target.value;
    }
    phoneChangeHandler(event){
        this.contactPhone = event.target.value;
    }
    creatContact(){
        const fields ={'LastName':this.contactLastName,'Phone':this.contactPhone,'Email':this.contcatEmail};
        const con = {apiName:"Contact",fields};
        createRecord(con).then(result =>{
            console.log('Contact has been created successfully ===>'+result.id); 
        }).catch(error =>{
            console.log('Error in create contact ===>'+error.body.message);
        });
    }
}