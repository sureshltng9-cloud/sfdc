@isTest
public class LeadProcessScheduleTest {
    @isTest
    public static void unitTest(){
        list<Lead> lds = new list<Lead>();
        for(integer i =1 ;i <= 200 ; i++){
            Lead l = new Lead();
            l.LastName = 'TestLead'+i;
            l.Status = 'Open - Not Contacted';
            l.Company = 'Energy';
            lds.add(l);
        }
        if(lds != null && lds.size() > 0){
            insert lds;
        }
        String crnExp = '0 30 5 12 12 ? 2023';
        test.startTest();
        LeadProcessSchedule jb = new LeadProcessSchedule();
        Id jobId = system.schedule('LeadProcess', crnExp, jb);
        
        CronTrigger ct = [SELECT TimesTriggered, NextFireTime,CronExpression FROM CronTrigger WHERE Id = :jobId];
        system.assertEquals(0, ct.TimesTriggered);
        system.assertEquals('0 30 5 12 12 ? 2023', ct.CronExpression);
        system.assertEquals('2023-12-12 05:30:00', string.valueOf(ct.NextFireTime));
        test.stopTest();
        
        list<Lead> leadList = [SELECT Id,Name,LeadSource FROM Lead WHERE LeadSource = 'Dream Force'];
        system.assertEquals(leadList.size(), 200);
    }
}