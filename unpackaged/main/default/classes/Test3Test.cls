@isTest
public with sharing class Test3Test {
   @isTest
   static void accTest(){
        list<Account> acc = new list<Account>();
        for(Integer i=0;i<3;i++){
          Account a = new Account();
          a.Name = 'Test'+i;
          a.Rating = 'Hot';
          acc.add(a);
        }
        insert acc;
        Test3 obj = new Test3();
        obj.getAccounts();
        List<Account> a = [SELECT Name,Rating FROM Account];
        string s = a[0].Rating;
        System.assertEquals('Hot', s);
   }
}