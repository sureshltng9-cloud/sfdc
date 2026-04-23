public class ListCls {
    public static void display(){
        //declaration and intialization of list
        list<string> lst = new list<string>{'sachin','rahul','jadeja'};
        system.debug('==========list elements are=========='+lst);
        
        // adding new element to the list
        lst.add('shastri');
        system.debug('==========after adding new element=========='+lst);
        
        // adding duplicate element to the list 
        lst.add('sachin');
        system.debug('==========after adding duplicate element=========='+lst);
        
        //display first elemnt in the list
        system.debug('==========first elemnt in the list=========='+lst.get(0));
        
        //removing an element from the list
        lst.remove(2);
        system.debug('===========after removing an element=============='+lst);
        system.debug('==========size of the list=========='+lst.size());
        
       //replacing an element in the list
       lst.set(1,'dravid');
        system.debug('===========after replacing an element=============='+lst);
        system.debug('==========size of the list=========='+lst.size());
        
        //sorting the list
        lst.sort();
        system.debug('===========after sorting the list=============='+lst);
        system.debug('==========size of the list=========='+lst.size());
        
        //iterating the list
        for(string s : lst){
            system.debug('===========Element in the list============'+s);
        }
        
        //cloning the list
        list<string> cloneList = lst.clone();
        system.debug('========clone list elements========'+cloneList);
         system.debug('==========size of the list=========='+cloneList.size());
        
        //removing all list elements
        lst.clear();
        system.debug('===========after removing the list=============='+lst);
        system.debug('==========size of the list=========='+lst.size());
        
    }
}