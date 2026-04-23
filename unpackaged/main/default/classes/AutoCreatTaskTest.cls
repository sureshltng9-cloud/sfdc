@isTest
public class AutoCreatTaskTest {
    public static testMethod void unitTest(){
        Case c = new Case();
        c.Status = 'Working';
        c.Origin ='Phone';
        c.Subject = 'Case Subject';
        c.Description = 'Case Description';
        insert c;
        
        Task t = [SELECT Status,OwnerId,Subject,WhatId,Description FROM Task WHERE WhatId =:c.Id];
        system.assertEquals(c.Id, t.WhatId);
        system.assertEquals(c.Subject, t.Subject);
        system.assertEquals(c.Description, t.Description);
    }
}