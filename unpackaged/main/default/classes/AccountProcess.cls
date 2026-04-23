public class AccountProcess {
	@future
    public static void chnageStatus(list<Id> accIds){
        list<Account> acList = [SELECT Id,Name,Industry,Rating,AnnualRevenue FROM Account WHERE Id IN :accIds];
        for(Account a : acList){
            a.rating = 'Hot';
        }
        update acList;
    }
}