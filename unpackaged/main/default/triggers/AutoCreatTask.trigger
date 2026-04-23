trigger AutoCreatTask on Case (after insert) {
    list<Task> tsk = new list<Task>();
    for(Case c : trigger.new){
        //Create Task to Corresponding Owner of That Case
        Task t = new Task();
        t.Status = 'New';
        t.OwnerId = c.OwnerId;
        t.Subject = c.Subject;
        t.WhatId = c.Id;
        t.Description = c.Description;
        tsk.add(t);
    }
    if(tsk != null && tsk.size() > 0){
        insert tsk;
    }
}