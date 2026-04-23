trigger PreventAccDel on Account (before delete) {
    for(Account acc : [SELECT Id,Rating,Industry FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN : Trigger.oldMap.keySet()]){
         trigger.oldMap.get(acc.Id).addError('You Can\'t Delete Account that have Contacts');
    }
}