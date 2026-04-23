public with sharing class ContactManager {
    @AuraEnabled(cacheable=true)
    public static list<contact> getContact(){
        return [SELECT Id,LastName,FirstName,Phone,Email FROM Contact];
    }
    @AuraEnabled(cacheable=true)
    public static list<contact> getContact2(integer numberOfContacts){
        return [SELECT Id,LastName,FirstName,Phone,Email FROM Contact LIMIT :numberOfContacts];
    }
    @AuraEnabled
    public static list<Account> accList(){
        return [SELECT Id,Name,Industry,Rating,AnnualRevenue FROM Account];
    }
    @AuraEnabled(cacheable=true)
    public static list<Account> accList1(){
        return [SELECT Id,Name,Industry,Phone,Type,Description,Rating,AnnualRevenue FROM Account];
    }
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccName(string searchKey){
       string key = searchKey+'%';
       list<Account> ac = [SELECT Id,Name,Rating FROM Account WHERE Name LIKE :key];
       system.debug(ac);
       return ac;
    }
}