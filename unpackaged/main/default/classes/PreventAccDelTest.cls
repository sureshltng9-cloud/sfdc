@isTest
public class PreventAccDelTest {
	@isTest
    public static void unitTest(){
        Account a = new Account(name='TestAcc',Rating='Hot');
        insert a;
        
        Contact c = new Contact();
        c.LastName = 'TestCon';
        c.AccountId = a.Id;
        insert c;
        
        Opportunity o = new Opportunity();
        o.Name = 'Test Opportunity';
        o.AccountId = a.Id;
        o.CloseDate = system.today().addMonths(3);
        o.StageName = 'Prospecting';
        insert o;
        try{
            Account ac = [SELECT Id,Name FROM Account WHERE Id =:a.Id LIMIT 1];
            delete ac;
        }
        catch(DMLException e){
            system.debug('======DML======'+e.getMessage());
        }
    }
}