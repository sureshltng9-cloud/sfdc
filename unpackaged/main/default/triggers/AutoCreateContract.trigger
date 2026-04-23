trigger AutoCreateContract on Opportunity (after insert,after update) {
    list<Contract> contractList = new list<Contract>();
    if(trigger.isInsert){
        for(Opportunity op : trigger.new){
            if(op.StageName == 'Closed Won' && op.AccountId != null){
                Contract ct = new Contract();
                ct.Status = 'Draft';
                ct.StartDate = system.today().addMonths(1);
                ct.ContractTerm = 9;
                ct.OwnerId = op.OwnerId;
                ct.AccountId = op.AccountId;
                contractList.add(ct);
            }
        }
    }
    if(trigger.isUpdate){
        for(Opportunity op : trigger.new){
            Opportunity oldOppty = trigger.oldMap.get(op.Id);
            if(oldOppty.StageName != 'Closed Won' && op.StageName == 'Closed Won' && op.AccountId != null){
                Contract ct = new Contract();
                ct.Status = 'Draft';
                ct.StartDate = system.today().addMonths(1);
                ct.ContractTerm = 9;
                ct.OwnerId = op.OwnerId;
                ct.AccountId = op.AccountId;
                contractList.add(ct);
            }
        }
    }
    if(contractList != null && contractList.size() >0){
        insert contractList;
    }
}