public class OutboundEmail {
    public static void emailServ(string s){
        list<messaging.singleEmailMessage> mails = new list<messaging.singleEmailMessage>();
        messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
        List<String> param1 = new List<String>();
        param1.add(s);
        mail.setToAddresses(param1);
        List<String> param2 = new List<String>();
        param2.add('test123@gmail.com');
        mail.setBccAddresses(param2);
        List<String> param3 = new List<String>();
        param2.add('test123@gmail.com');
        mail.setCcAddresses(param3);
        mail.setSubject('Welcome Subject');
        mail.setPlainTextBody('Welcome to Salesforce World');
        mail.setSenderDisplayName('Salesforce');
        mail.setInReplyTo('test@gmail.com');
        mails.add(mail);
    	if(mails != null && mails.size() >0){
        	messaging.sendEmail(mails);
    	}
    }
}