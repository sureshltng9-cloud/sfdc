global class Email2Lead implements Messaging.InboundEmailHandler{
     global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope){
                                                        
         Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
                                                        
          // Create an Instance of the Lead Object
          Lead l = new Lead();
          l.lastname = email.fromName;                                              
          l.Company = email.subject;
          l.Email = envelope.fromAddress;
          l.Description = email.plainTextBody;
          l.status = 'Open - Not Contacted';
          Insert l;
          system.debug('========Method Calling==========');
           List<Attachment> attlist = new List<Attachment>();
                                                        
          if(email.binaryAttachments != Null && email.binaryAttachments.size() > 0){
              for(Integer i = 0; i < email.binaryAttachments.size(); i++){
                  Attachment at = new Attachment();
                  at.name = email.binaryAttachments[i].filename;
                  at.Body = email.binaryAttachments[i].body;
		  		  at.ParentId = l.id;
                  attlist.add(at);
              }
          }                                                   
          
        if(attlist != Null && attlist.size() > 0){
            Insert attlist;
        }
        
        return result;
                                                    
      }
}