import { LightningElement } from 'lwc';

export default class MeetingRooms extends LightningElement {
    rooms = [
        {name:'A00-1',capacity:32},
        {name:'A00-2',capacity:29},
        {name:'A00-3',capacity:30}
    ];
}