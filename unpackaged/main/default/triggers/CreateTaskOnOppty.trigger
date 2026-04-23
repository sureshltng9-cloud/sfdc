trigger CreateTaskOnOppty on Opportunity (after insert,after Update) {
    list<Task> taskList = new list<Task>();
    for(Opportunity op : trigger.new){
        task t = new task();
        t.Status = 'New';
        t.Description = 'Oppty Description';
        t.Subject = 'Oppty Subject';
        t.WhatId = op.Id;
        t.OwnerId = op.OwnerId;
        t.Priority = 'High';
        taskList.add(t);
    }
    if(taskList != null && taskList.size() > 0){
        insert taskList;
    }
}