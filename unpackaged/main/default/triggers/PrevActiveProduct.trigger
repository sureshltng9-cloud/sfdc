trigger PrevActiveProduct on Product2 (before delete) {
    for(Product2 p : [SELECT Id FROM Product2 WHERE IsActive = true AND Id IN : Trigger.oldMap.keySet()]){
            trigger.oldMap.get(p.Id).addError('You can\'t Delete a Active Product2');
    }
}