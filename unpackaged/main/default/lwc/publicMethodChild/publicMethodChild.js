import { LightningElement,api } from 'lwc';

export default class PublicMethodChild extends LightningElement {
    value=['Vivekananda'];
    options = [
               {label:'Swami Vivekananda',value:'Vivekananda'},
               {label:'APJ Kalam',value:'Kalam'}
              ];
    @api
    checkBoxChecked(check){
        let result = this.options.find(opt => {return opt.value === check});
        if(result){
            this.value = result.value;
            console.log('checking==========>'+typeof this.value);
           return 'checkBox is Checked';
        }
        return 'checkBox is Undefined';
    }
}