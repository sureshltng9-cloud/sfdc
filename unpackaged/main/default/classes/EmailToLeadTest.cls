@isTest
public class EmailToLeadTest {
    @isTest
    public static void unitTest(){
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope envolop =new  Messaging.InboundEnvelope();
        email.fromName = 'Test Name';
        email.fromAddress = 'test@123.com';
        email.plainTextBody = 'Salesforce World';
        email.subject = 'Test Subject';
        
        messaging.InboundEmail.binaryAttachment att = new  messaging.InboundEmail.binaryAttachment();
        att.fileName = 'Test Attach Name.txt';
        att.body = Blob.valueOf('Test Body');
        att.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new list<messaging.InboundEmail.binaryAttachment>{att};
        EmailToLead obj = new EmailToLead();
        obj.handleInboundEmail(email, envolop);
        
        Lead lds = [SELECT Id,LastName,Email,Description,Company,Status FROM Lead WHERE Email = 'test@123.com'];
        system.assertEquals('test@123.com',lds.Email);
        system.assertEquals('Test Name',lds.LastName);
        system.assertEquals('Open - Not Contacted',lds.Status);       
    }
}