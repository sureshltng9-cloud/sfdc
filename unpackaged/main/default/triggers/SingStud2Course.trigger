trigger SingStud2Course on Student__c (before insert) {
    set<Id> courses = new set<Id>();
    for(Student__c s : trigger.new){
        if(s.Course__c != null){
            courses.add(s.Course__c);
        }
    }
    map<Id,Course__c> cmap = new map<Id,Course__c>();
    for(course__c c : [SELECT Id,(SELECT Id FROM Students__r) FROM Course__c WHERE  Id IN :courses] ){
        if(c.Students__r != null && c.Students__r.size() > 0){
            cmap.put(c.Id,c);
        }
    }
    for(Student__c s : trigger.new){
        if(cmap.keySet().contains(s.Course__c)){
            s.addError('Selected Course already have Students');
        }
    }
}