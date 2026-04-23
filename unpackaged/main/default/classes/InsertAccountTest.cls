@isTest
public class InsertAccountTest {
	@isTest
    public static void unitTest(){
        Test.startTest();
        	InsertAccount obj = new InsertAccount();
        	system.enqueueJob(obj);
        Test.stopTest();
        
        // Assert the Results
        Account a = [SELECT Id,Name FROM Account LIMIT 1];
        //Contact c = [SELECT Id,Firstname,Lastname,email FROM Contact LIMIT 1];
        
        //Account a = [SELECT Id,Name FROM Account WHERE Name = 'Test Account' LIMIT 1];
        //system.assertEquals('Test Account', a.Name);
        //Contact c = [SELECT Id,LastName,AccountId FROM Contact WHERE LastName = 'Test Contact' LIMIT 1];
        //system.assertEquals('Test Contact', c.LastName);
        //system.assertEquals(a.Id, c.AccountId);
    }
}