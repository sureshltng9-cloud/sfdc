global class AccountUpdate implements Database.Batchable<sObject>{
    global database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id,Name,AnnualRevenue,CustomerPriority__c FROM Account WHERE AnnualRevenue >= 10000000');
    }
    global void execute(Database.BatchableContext bc,list<Account> acc){
        list<Account> acUpdateList = new list<Account>();
        for(Account ac : acc){
            ac.CustomerPriority__c = 'High';
            acUpdateList.add(ac);
        }
        if(acUpdateList != null && acUpdateList.size() >0){
            update acUpdateList;
        }
    }
    global void finish(Database.BatchableContext bc){
        
    }
}