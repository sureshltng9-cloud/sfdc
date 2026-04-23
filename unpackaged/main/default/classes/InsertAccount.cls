public class InsertAccount implements Queueable{
    public void execute(QueueableContext qc){
         // Create an Account Record
        // Account is a Non Setup Object.
        Account a = new Account();
        a.name = 'Wipro';
        a.Industry = 'Technology';
        a.Rating = 'Hot';
        Insert a;
        // Call another Queueable Class
        // to insert the Contact with this
        // Account
        // Create an Instance of the Queuable Class you are Calling
        if(!test.isRunningTest()){
            InsertContact queueable = new InsertContact(a);
            system.enqueueJob(queueable);
        }
    }
}