trigger PreventConDelete on Contact (before delete) {
    for(Contact c : [SELECT LastName,FirstName,Email FROM Contact WHERE AccountId IN (SELECT Id FROM Account) AND Id IN : trigger.oldMap.keySet()]){
        trigger.oldMap.get(c.Id).addError('Contact That Have Accounts Can not be Deleted');
    }
}