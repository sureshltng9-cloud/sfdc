public class RenderedCon {

    public boolean show { get; set; }

    public Account acc { get; set; }
    
    public RenderedCon(){
        acc = [SELECT Id,Name,Rating,Industry FROM Account LIMIT 1];
        show = false;
    }

    public PageReference showDetails() {
        show = true;
        return null;
    }

}