import { LightningElement ,api} from 'lwc';

export default class LdsEditForm extends LightningElement {
    @api recordId;
    @api objectApiName;
}