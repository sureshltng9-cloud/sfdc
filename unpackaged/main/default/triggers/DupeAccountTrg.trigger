trigger DupeAccountTrg on Account (before insert) {
    set<String> accNames = new set<String>();
    for(Account a : trigger.new){
       accNames.add(a.Name); 
    }
    list<Account> acList = [SELECT Id,Name FROM Account WHERE Name IN :accNames];
    map<string,Account> accMap = new map<string,Account>();
    for(Account acc : acList){
        accMap.put(acc.Name,acc);
    }
    for(Account a : trigger.new){
        if(a.Name == accMap.get(a.Name).Name){
            a.addError('Duplicate Names are not Allowed');
        }
    }
}