trigger AutoPopulatePhone on Contact (before insert,before update) {
    set<Id> accIds = new set<Id>();
    for(contact c : trigger.new){
        if(c.AccountId != null){
             accIds.add(c.AccountId);
        }
    }
    Map<Id,Account> accMap = new Map<Id,Account>([SELECT Id,Name,Phone FROM Account WHERE Id IN : accIds]);
    for(contact c : trigger.new){
        if(c.Phone == null && c.AccountId != null){
            
        }
        c.Phone = accMap.get(c.AccountId).Phone;
    }
}