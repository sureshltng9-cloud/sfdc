public class RenderAsCon {

    public List<Account> getAccs() {
        list<Account> acs = [SELECT Id,Name,Rating,Industry FROM Account];
        return acs ;
    }

}