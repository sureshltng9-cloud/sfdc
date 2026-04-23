public class DeleteLeads {
    
    public list<wrapper> wrps;

    public list<Wrapper> getWraps() {
        list<Wrapper> wrapList = new list<Wrapper>();
        for(lead l : [SELECT Id,FirstName,LastName,Email,Status,LeadSource FROM Lead]){
            Wrapper wr = new Wrapper(false,l);
            wrapList.add(wr); 
        }
         wrps = wrapList;
        return wrapList;
    }


    public PageReference DeleteLeads() {
        list<lead> lds = new list<Lead>();
        for(wrapper w : wrps){
            if(w.b == true){
                lds.add(w.l);
            }
        }
        if(lds != null && lds.size() > 0){
            delete lds;
        }
        return null;
    }
    
    public class wrapper{
        public boolean b {get; set;}
        public lead l {get; set;}
        public wrapper(boolean bb,Lead ll){
            b = bb;
            l = ll;
        }
    }

}