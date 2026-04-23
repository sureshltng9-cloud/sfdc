trigger EmailMandatory on Contact (before insert) {
    for(contact c : trigger.new){
        if(c.Email == Null){
            c.Email.addError('Email is a Mandatory Field');
        }
    }
}