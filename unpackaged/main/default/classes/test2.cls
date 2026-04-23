public class test2 {
    public string name;
    public integer age;
    public test2(){
        //system.debug('========Constructor is invoked===========');
    }
    public void setName(string sname){
        name = sname;
        //system.debug('==================='+name);
    }
    public string getName(){
        return name;
    }
    public void setAge(Integer sage){
        age = sage;
        //system.debug('==================='+age);
    }
    public Integer getAge(){
        return age;
    }
    public void print(){
        system.debug('==================='+name);
        system.debug('==================='+age);
    }
}