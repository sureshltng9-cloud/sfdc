public class AccCon {

    string accId;
    public AccCon(){
        accId = ApexPages.currentPage().getParameters().get('id');
    }
    public list<Contact> getCons() {
        
       return [SELECT FirstName,LastName,Email FROM Contact WHERE AccountId = :accId];
    }
}