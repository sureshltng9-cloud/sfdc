import { LightningElement ,api,wire} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import accList from '@salesforce/apex/ContactManager.accList';
import getContact from '@salesforce/apex/ContactManager.getContact';
import {fireEvent} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
import { createRecord,getRecord } from 'lightning/uiRecordApi';
export default class T1EmployeDetails extends LightningElement {
    firstNumber;
    secondNumber;
    phone;
    result;
    recor;
    data;
    fieldsArry = ['Contact.FirstName','Contcat.LastName','Contcat.Phone'];
    
    @wire(getRecord,{recordId:'$recor',fields:'$fieldsArry'}) 
    cont({error,data}){
        if(data){
            alert('data');
            console.log('data=======>'+JSON.stringify(data));
            this.data = data;
        }else if(error){
            alert('data error');
            console.log('data=======>'+JSON.stringify(error));
        }
    };
    fisrtHandler(event){
        this.firstNumber = event.target.value;
    }
    secondHandler(event){
        this.secondNumber = event.target.value;
    }
    phoneHandler(event){
        this.phone = event.target.value;
    }
    calculateHandler(){
        const fields = {'FirstName':this.firstNumber,'LastName':this.secondNumber,'Phone':this.phone};
        alert(JSON.stringify(fields));
        const con = {apiName:"Contact",fields};
        createRecord(con)
        .then(result => {
            console.log(JSON.stringify(result));
            alert('successfull');
            this.recor = result.id;
        })
        .catch(error =>{
            console.log(JSON.stringify(error));
            console.log(JSON.stringify(error.body));
            console.log(JSON.stringify(error.body.message));
            alert('error');
        });

    }
    get conFirstName(){
        if(this.data){
            //console.log('=============>'+this.data);
            return this.data.fields.FirstName.value;
        }
    }
    get conLastName(){
        if(this.data){
            //console.log('=============>'+this.cont.data);
            return this.data.fields.LastName.value;
        }
    }
    get conPhone(){
        if(this.data){
            //console.log('=============>'+this.cont.data);
            return this.data.fields.Phone.value;
        }
    }
}