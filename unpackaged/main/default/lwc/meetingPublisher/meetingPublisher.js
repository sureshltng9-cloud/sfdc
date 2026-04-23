import { LightningElement,wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';
export default class MeetingPublisher extends LightningElement {
    @wire(CurrentPageReference) pageRef;
    meetingRoomInfo = [
        {name:"A1",capacity:32},
        {name:"A2",capacity:35},
        {name:"A3",capacity:57}
    ];
    roomHandler(event){
        console.log('roomHandler=====>'+event.target.label);
        let name = event.target.label;
        let c = this.meetingRoomInfo.find((s)=>{ return s.name === name});
        //because you can't pass undefined value in 'c' 
        if(c != undefined && c != null){
            console.log('c=========>'+c);
            fireEvent(this.pageRef,"roomData",c);
        }
    }
}