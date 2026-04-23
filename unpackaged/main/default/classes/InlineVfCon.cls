public class InlineVfCon {
    public Account acc {get; set;}
    public Id accId;
    public InlineVfCon(ApexPages.StandardController controller) {
        Id conId = controller.getId();
        accId = [SELECT Id,AccountId FROM Contact WHERE Id =: conId].AccountId;
        acc = [SELECT Id,Name,Rating,Industry FROM Account WHERE Id = :accId];
    }

}