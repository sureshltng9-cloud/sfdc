public with sharing class Test5 {
    public static void display(){
        list<string> lst = new list<string>{'dravid','sachin','kapil'};
        system.debug('=======lst======='+lst);
        system.debug('========size=========='+lst.size());
        
        //adding element
        lst.add('tendulkar');
        system.debug('=======lst1======='+lst);
        system.debug('========size1=========='+lst.size());
        
        //adding duplicate element
        lst.add('sachin');
        system.debug('=======lst dpl======='+lst);
        system.debug('========size1 dpl=========='+lst.size());
        
        //get fist element from list
        system.debug('====lst first element====='+lst.get(0));
        
        //remove first element of list
        lst.remove(0);
        system.debug('=======lst after remove======='+lst);
        system.debug('========size1 after remove=========='+lst.size());
        
        //clone list
        list<string> clnLIst = lst.clone();
        system.debug('=======clone lst======='+lst);
        system.debug('========clone size1=========='+lst.size());
        
        //clear list
        lst.clear();
        system.debug('======size after clear========'+lst.size());
        
        //checking if it is empty
        system.debug('==========lst============='+lst.isEmpty());
        system.debug('==========clnLIst============='+clnLIst.isEmpty());
        
        //sort
        clnLIst.sort();
        system.debug('===========sort==========='+clnLIst);
        
        //display list data
        for(string s : clnLIst){
            system.debug('=====list element====='+s);
        }
        
        clnLIst.set(3,'Kumble');
        system.debug('========after setting a elemnt========'+clnLIst);
    }
    public static void permissionAdd(){
        boolean b = featureManagement.checkPermission('test_Custom_permission');
        system.debug('======permission=========='+b);
    }
}