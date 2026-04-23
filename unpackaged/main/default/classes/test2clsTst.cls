@isTest
public class test2clsTst {
	@isTest
    public static void testmdt(){
        test2 obj = new test2();
        obj.setName('Vivekananda');
        string actual = obj.getName();
        system.assertEquals('Vivekananda', actual);
        system.assert(actual != null);
    }
}