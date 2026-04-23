trigger PreventAccDelete on Account (before delete) {
    for(Account a : [SELECT Id,Name FROM Account WHERE Id IN (SELECT AccountId FROM Contact) AND Id IN :trigger.oldMap.keySet()]){
        trigger.oldMap.get(a.Id).addError('Account That Have Contacts Can not be Deleted');
    }
}