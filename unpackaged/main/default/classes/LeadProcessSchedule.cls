public class LeadProcessSchedule implements schedulable{
    public void execute(schedulableContext sc){
        list<Lead> lds = [SELECT Id,Name,LeadSource FROM Lead WHERE LeadSource = ''];
        list<Lead> leadList = new list<Lead>();
        for(Lead l : lds){
            l.LeadSource = 'Dream Force';
            leadList.add(l);
        }
        if(leadList != null && leadList.size() >0){
           update leadList; 
        }
    }
}