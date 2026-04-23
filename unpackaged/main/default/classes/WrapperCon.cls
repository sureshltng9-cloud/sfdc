public class WrapperCon {

    public list<wrapper> wrapLeads { get; set; }
    
    public WrapperCon(){
        list<wrapper> wrpList = new list<wrapper>();
        for(Lead l : [SELECT Id,FirstName,LastName FROM Lead]){
            wrpList.add(new wrapper(l,false));
        }
        wrapLeads = wrpList;
    }

    public PageReference deleteLds() {
        list<Lead> delLeads = new list<Lead>();
        for(wrapper wr : wrapLeads){
            if(wr.b == true){
                delLeads.add(wr.l);
            }
        }
        if(delLeads != null && delLeads.size() > 0){
            delete delLeads;
        }
        
        list<wrapper> wrpList1 = new list<wrapper>();
        for(Lead l : [SELECT Id,FirstName,LastName FROM Lead]){
            wrpList1.add(new wrapper(l,false));
        }
        wrapLeads = wrpList1;
        
        return null;
    }
    
    public class wrapper{
        public lead l {set; get;}
        public boolean b {set; get;}
        public wrapper(lead ld,boolean check){
            l = ld;
            b = check;
        }
    }

}