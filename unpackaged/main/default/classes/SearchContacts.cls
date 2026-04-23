public class SearchContacts {

    public boolean show { get; set; }

    public list<Contact> conts { get; set; }
    
    public String search { get; set; }

    public SearchContacts(){
        show = false;
    }

    
    public PageReference seachCon() {
        string s = search + '%';
        conts = [SELECT Id,FirstName,LastName,Email FROM Contact WHERE FirstName Like : s];
        system.debug('========Contacts=========='+conts);
         system.debug('========Before Show=========='+show);
        if(conts != null && conts.size() > 0){
            system.debug('========After Show=========='+show);
            show = true;
        }
        return null;
    }
}