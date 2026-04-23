import { LightningElement,track,wire } from 'lwc';
import getAcc from '@salesforce/apex/ContactManager.getAccName';

export default class SearchTable extends LightningElement {
    @track data =[];
    key = '';
    check = false;
    columns = [{label:'Name',fieldName:'Name'},
               {label:'Rating',fieldName:'Rating'}];

    @wire(getAcc,{searchKey : '$key'})
    accs({error,data}){
        if(data){
            if(data.length == 0){
                this.check = false;
            }
            else{
                this.check = true;
            }
            console.log('=======length'+JSON.stringify(data.length));
           console.log('=======Test data'+JSON.stringify(data));
           this.data = data; 
        } else if(error){
            console.log('=======Test'+JSON.stringify(error));
        }
    }
    keyHandler(event){
        this.key = event.target.value;
    }
}