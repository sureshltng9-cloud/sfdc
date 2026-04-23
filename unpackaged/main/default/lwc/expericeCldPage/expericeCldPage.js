import { LightningElement ,wire} from 'lwc';
import USER_ID from '@salesforce/user/Id';
import USER_NAME from '@salesforce/schema/User.Name';
import USER_EMAIL from '@salesforce/schema/User.Email';
import { getRecord } from 'lightning/uiRecordApi';
export default class ExpericeCldPage extends LightningElement {
    value = '';
    @wire(getRecord,{recordId:USER_ID,fields:[USER_NAME,USER_EMAIL]}) urs;
    chgHandler(event){
        this.value = event.target.value;
        console.log('=====handler========='+JSON.stringify(this.urs));
        console.log('=============='+JSON.stringify(this.urs.data.fields.Name.value));
    }
    get pds(){
        return USER_ID;
    }
    get nds(){
        if(this.urs.data){
            return this.urs.data.fields.Name.value;
        }
        return 'Guest User';
    }
}