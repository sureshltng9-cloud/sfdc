trigger DuplicateAccTrg on Account (before insert) {
    set<string> accNames = new set<string>();
    for(account a : trigger.new){
        accNames.add(a.Name);
    }
    map<string,Account> accMap = new map<string,Account>();
    for(Account a : [SELECT Id,Name FROM Account WHERE Name IN :accNames]){
        accMap.put(a.Name,a);
    }
    for(account ac : trigger.new){
        if(ac.Name == accMap.get(ac.Name).Name){
            ac.Name.addError('Duplicate Names Are Not Allowed');
        }
    }
}