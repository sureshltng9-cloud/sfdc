public class SubEmp extends Emp{
    public SubEmp(){
        super('Rahul','Dravid');
        //Super.printDetails();
        system.debug('=========Sub Class Constructor is Calling========');
    }
    public override void printDetails(){
        super.printDetails();
        system.debug('========First Name========='+super.getFirstName());
    }
}