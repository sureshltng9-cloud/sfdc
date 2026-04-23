public class SelectCon {

    public String selectCountry { get; set; }

    public String selectState { get; set; }
    
    public list<selectoption> getOptions() {
        system.debug('==========calling============'+selectCountry );
        list<selectoption> opts = new list<selectoption>();
        if(selectCountry == 'India'){
            opts.add(new selectoption('AP','AP'));
            opts.add(new selectoption('Telangana','Telangana'));
            opts.add(new selectoption('TamilNadu','TamilNadu'));
        }
        else if(selectCountry == 'USA'){
            opts.add(new selectoption('NY','NY'));
            opts.add(new selectoption('Texas','Texas'));
            opts.add(new selectoption('Florida','Florida'));
        }
        else{
             opts.add(new selectoption('none','--none--'));
        }
        return opts;
    }
}