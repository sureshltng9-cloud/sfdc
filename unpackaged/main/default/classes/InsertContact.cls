public class InsertContact implements Queueable{
    public account acc;
    //Queueable methods allows to pass sobjects.
    public InsertContact(Account a){                                                                                                                                                                                                                                                   
        acc = a;
    }
    public void execute(QueueableContext qc){
         // Create a Contact Record
         Contact c = new Contact();
         c.FirstName = 'Azim';
         c.LastName = 'Premji';
         c.Email = 'apremji@gmail.com';
         c.AccountId = acc.Id;
         Insert c;
        system.debug('Calling');
    }
}