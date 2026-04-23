trigger MakeOpptyPrivate on Opportunity (before insert,before update) {
    for(Opportunity op : trigger.new){
        if(op.LeadSource == 'Partner Referral' && op.IsPrivate == False){
            op.IsPrivate = true;
        }
    }
}