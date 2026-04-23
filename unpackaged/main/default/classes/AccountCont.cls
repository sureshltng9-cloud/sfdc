global class AccountCont {

    public boolean show { get; set; }

    public Account acc { get; set; }
    
    public AccountCont(){
        acc = [SELECT Id,Name,Rating,Industry FROM Account LIMIT 1];
    }

    public void show() {
        show = true;
    }
    public void hide() {
       show = false;
    }
    webservice static void getRecord(id accid){
        list<Account> acc = [SELECT Id,Name,Rating FROM Account WHERE Id =: accid];
    }

}