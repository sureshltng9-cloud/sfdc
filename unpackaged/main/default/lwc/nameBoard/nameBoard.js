import { LightningElement,track,wire } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import {getRecord,updateRecord} from 'lightning/uiRecordApi';
import getContacts from  '@salesforce/apex/ContactManager.getContact2';
import {refreshApex} from '@salesforce/apex';

export default class NameBoard extends LightningElement {
    greentings = '';
    check = false;
    recordId = '0012w000016TjSqAAK';
    rtng = RATING_FIELD;
    cons = 5;
    @track data =[];
    @track consData = [];
    @track draftValues = [];
    columns = [{label:'First Name',fieldName:'FirstName',editable:true,type:'text'},
               {label:'Last Name',fieldName:'LastName',editable:true,type:'text'},
               {label:'Phone',fieldName:'Phone',editable:false,type:'phone'}
              ];

    @wire(getContacts,{numberOfContacts : '$cons'})
    cons(rst){
        this.consData = rst;
        if(rst.data){
            console.log('============wired contacts======'+JSON.stringify(rst.data));
            this.data = rst.data;
        }else if(rst.error){
            console.log('============wired contacts======'+JSON.stringify(error));
        }
    }
    saveChange(event){
        this.draftValues = event.detail.draftValues;
        console.log('=======draft values========'+JSON.stringify( this.draftValues));
        let Record2Update = [];
        for(let i  in  this.draftValues){
            let fields =  this.draftValues[i];
            Record2Update.push({fields});
        }
        console.log('=======Loop records====='+JSON.stringify(Record2Update));
        let pomises = Record2Update.map(rt => {return updateRecord(rt)});
        Promise.all(pomises)
        .then(result =>{ console.log('=======Promise Then====='+JSON.stringify(result));
        this.draftValues =[];
        this.refresh();
        })
        .catch(error =>{console.log('=======Promise Error====='+JSON.stringify(error));})
        .finally(() =>{  this.draftValues =[]; });
    }
    async refresh(){
        await refreshApex(this.consData);
    }
    
}