trigger EmailChangeTrg on Contact (before update) {
    for(Contact c : trigger.new){
        Contact oldContact = trigger.oldMap.get(c.Id);
        if(oldContact.Email != Null && oldContact.Email != c.Email){
            c.Email.addError('You Can\'t Change Old Email');            
        }
    }
}