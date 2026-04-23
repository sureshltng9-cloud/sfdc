@isTest
public class AccountProcessTest {
    @testSetup
    public static void testDt(){
        list<Account> acList = new list<Account>();
        for(integer i=1;i <= 100;i++){
            Account a = new Account();
            a.Name = 'Acc'+i;
            a.Rating = 'Cold';
            acList.add(a);
        }
        if(acList != null && acList.size() > 0 ){
            insert acList;
        }
    }
    @isTest
    public static void unitTest(){
        map<Id,Account> accMap = new map<Id,Account>([SELECT Id,Name,Rating FROM Account]);
        test.startTest();
        list<Id> ids = new list<Id>(accMap.keySet());
        AccountProcess.chnageStatus(ids);
        list<Account> ac1 = [SELECT Id,Name,Rating FROM Account WHERE Rating = 'Cold'];
        system.assertEquals(100, ac1.size());
        test.stopTest();
        list<Account> ac2 = [SELECT Id,Name,Rating FROM Account WHERE Rating = 'Hot'];
        system.assertEquals(100, ac2.size());
    }
}