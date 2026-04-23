trigger OpptyStageChange on Opportunity (before update) {
    for(Opportunity opp : trigger.new){
        system.debug('======New Stage Value====='+trigger.newMap.get(opp.Id).StageName);
        system.debug('==========Old Stage Name========'+trigger.oldMap.get(opp.Id).StageName);
        
        Opportunity oldOpp = trigger.oldMap.get(opp.Id);
        if((oldOpp.StageName == 'Closed Won' && opp.StageName !='Closed Won') ||(oldOpp.StageName == 'Closed Lost' && opp.StageName !='Closed Lost')) {
           opp.StageName.addError('You Can not Change Closed Opportunities');
        }
    }
}