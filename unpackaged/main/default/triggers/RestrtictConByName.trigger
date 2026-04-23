trigger RestrtictConByName on Contact (before insert,before update) {
    for(Contact c : trigger.new){
        if(c.LastName == 'INVALIDNAME'){
            c.addError('INVALIDNAME Name Is Not Allowed');
        }
    }
}