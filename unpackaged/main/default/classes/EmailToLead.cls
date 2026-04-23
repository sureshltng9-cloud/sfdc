public class EmailToLead implements messaging.InboundEmailHandler{
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envolop){
        Messaging.InboundEmailResult result = new  Messaging.InboundEmailResult();
        Lead l =new Lead();
        l.LastName = email.fromName;
        l.Email = email.fromAddress;
        l.Description = email.plainTextBody;
        l.Company = email.subject;
        l.Status = 'Open - Not Contacted';
        insert l;
        
        list<Attachment> attList = new list<Attachment>();
        if(email.binaryAttachments != null && email.binaryAttachments.size() > 0){
            for(Integer i = 0;i <=  email.binaryAttachments.size();i++){
                Attachment a = new Attachment();
                a.Name = email.binaryAttachments[0].fileName;
                a.Body = email.binaryAttachments[0].body;
                a.ParentId = l.Id;
                attList.add(a);
            }
            if(attList != null && attList.size() > 0){
                insert attList;
            }
        }
        return result;
    }
}