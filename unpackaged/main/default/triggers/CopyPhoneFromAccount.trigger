trigger CopyPhoneFromAccount on Contact (before insert,before update) {
    set<Id> accIds = new set<Id>();
    for(Contact c : trigger.new){
        if(c.AccountId != null){
             accIds.add(c.AccountId);
        }
    }
    map<Id,Account> accMap = new map<Id,Account>([SELECT Id,Name,Phone FROM Account WHERE Id IN : accIds]);
    for(Contact con : trigger.new){
        if(con.AccountId != null && con.Phone == null){
            con.Phone = accMap.get(con.AccountId).Phone;   
        }
    }
    
}