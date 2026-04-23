public class setCls {
    public static void display(){
        //declaring and intializing a set
        set<string> st = new set<string>{'sachin','rahul','kumble'};
        system.debug('==========set elements are========'+st);
        system.debug('==========set elements size========'+st.size());
        
        //adding an element to set
        st.add('jadeja');
        system.debug('==========after adding new element set elements are========'+st);
        system.debug('==========after adding new element set elements size========'+st.size());
        
        //adding duplicate element
        st.add('sachin');
        system.debug('==========after adding duplicate element set elements are========'+st);
        system.debug('==========after adding duplicate element set elements size========'+st.size());
        
       //checking wether set contains element or not
       boolean ck = st.contains('jadeja');
       system.debug('=========containsjadeja element ========='+ck);
        
       //removing an element 
       st.remove('rahul');
       system.debug('==========after removing  element set elements are========'+st);
       system.debug('==========after removing  element set elements size========'+st.size());
        
       //iterating set elements
        for(string s : st){
            system.debug('=========set elemet========='+s);
        }
        
        //cloning set 
        set<string> cloneSet = st.clone();
        system.debug('==========after cloning  set elements are========'+st);
        system.debug('==========after cloning  set elements size========'+st.size());
        
        //removing all elements from the set
        st.clear();
        system.debug('==========after removing  all elements========'+st);
        system.debug('==========after removing  all elements size========'+st.size());
        
        //check wether set empty
        system.debug('==========is set empty==========='+st.isEmpty());
        
    }
}