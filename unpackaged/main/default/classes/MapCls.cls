public class MapCls {
    public static void display(){
        //declaring and initializing a map
        map<integer,string> mp = new map<integer,string>{1=>'sachin',2=>'dravid',3=>'raina'};
        system.debug('==========map keys=========='+mp.keySet());
        system.debug('==========values==========='+mp.values());
        
        //adding an element to map
        mp.put(4,'jadeja');
        system.debug('==========after adding map keys=========='+mp.keySet());
        system.debug('==========after adding values==========='+mp.values());
    }
}