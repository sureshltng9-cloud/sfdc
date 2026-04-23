public class SelectOptionCon {

    public list<SelectOption> getOptions() {
        list<SelectOption> opts = new list<SelectOption>();
        opts.add(new selectOption('AP','AP'));
        opts.add(new selectOption('Telangana','Telangana'));
        opts.add(new selectOption('NY','NY'));
        return opts;
    }


    public String SelectState { get; set; }

    public String SelectCountry { get; set; }
}