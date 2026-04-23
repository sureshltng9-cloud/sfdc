public with sharing class DeleteLeadsCon {

    public DeleteLeadsCon(){
        list<Wrapper> wr = new list<Wrapper>();
        for(Lead l : [SELECT FirstName,LastName,Email,Status,LeadSource FROM Lead]){
            Wrapper w = new Wrapper(false,l);
            wr.add(w);
        }
        system.debug('=====Check======'+wr);
        WrapLeads = wr;
    }

    public list<Wrapper> WrapLeads { get; set; }

    public PageReference DeleteLeads() {
        list<Lead> dlLeads = new list<Lead>(); 
        for(Wrapper w : WrapLeads){
            if(w.check == true){
                dlLeads.add(w.ld);
            }
        }
        delete dlLeads;
        return null;
    }                     
    
    public class Wrapper {
    
    public Boolean check{get; set;}
    
    public Lead ld {get; set;}
    
    public Wrapper(Boolean b,Lead l){
        check = b;
        ld  = l;
    }
    }

}