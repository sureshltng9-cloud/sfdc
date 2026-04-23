public class test1 {
    public string mystring;
    public static integer i = 0;
    public test1(){
        i++;
        system.debug('======Result====='+i);
    }
    public void check(string s){               
        system.debug('=========Check the scentance========='+s);
        system.debug('=========Check the mystring========='+mystring);
    }
    public static void google(string p){ 
        system.debug('=========Check the static method========='+p);
    }
}