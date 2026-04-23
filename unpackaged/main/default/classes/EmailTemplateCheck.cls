public class EmailTemplateCheck {
    public static void cstEmail(){
        /*string tr = ''; 
        for(contact c : [SELECT Name,Email,Phone FROM Contact WHERE Email != null LIMIT 5]){
              tr += '<tr><td>' + c.Name+ '</td><td>' + c.Email + '</td><td>' + c.Phone + '</td></tr>';
        }
        
        EmailTemplate temp = [SELECT DeveloperName,HtmlValue,Id,Name FROM EmailTemplate WHERE DeveloperName='Test_DataTable' LIMIT 1];
        string ht = temp.HtmlValue;
        
        ht = ht.replace('[data]',tr);
        list<messaging.singleEmailMessage> emails = new list<messaging.singleEmailMessage>();
        messaging.singleEmailMessage mail = new messaging.singleEmailMessage();
        mail.setSubject('Test Subject');
        mail.setHtmlBody(ht);
        mail.setToAddresses(new list<string>{'a.suresh762@gmail.com'});
        
        //create attachments =====vf page as a attachment
        PageReference pg1 = Page.wrapper;
        //pag1.getParameters().put('id','ghdf6876786sfhjh');
        //PageReference pg1
        //create custom emailtemplate as it file attachment
        
        messaging.EmailFileAttachment att2 = new messaging.EmailFileAttachment();
        att2.setFileName('template.pdf');
        att2.setContentType('application/pdf');
        att2.setInline(false);
        att2.Body = Blob.toPDF(ht);
        mail.setFileAttachments(new List<Messaging.EmailFileAttachment>{att,att2});
        
        
        
        emails.add(mail);
          system.debug('================'+ht);
        try{
            messaging.sendEmail(emails);
        }catch(exception e){
            system.debug('================'+e.getMessage());
        }*/
        EmailTemplate tmp = [SELECT Id,HtmlValue FROM EmailTemplate WHERE DeveloperName = 'Test_DataTable' LIMIT 1];
		string htmlBdy = tmp.HtmlValue;
		//htmlBdy = htmlBdy.replace('[Student_Name]','replaceText');
		
		PageReference pr = Page.wrapper;
		//pr.getParameters().put('id','78987sdg789');
		blob blodPdf = pr.getContentAsPDF();
		
		list<messaging.singleEmailMessage> emails = new list<messaging.singleEmailMessage>();
		messaging.singleEmailMessage email = new messaging.singleEmailMessage();
		email.setToAddresses(new list<string>{'a.suresh@gmail.com'});
		email.setSubject('Student Name '+'Program Invoice');
		email.setHtmlBody(htmlBdy);
		
		messaging.EmailFileAttachment attch = new messaging.EmailFileAttachment();
		attch.setFileName('Family.pdf');
		attch.setContentType('application/pdf');
		attch.setBody(blodPdf);
		
		email.SetFileAttachments(new list<messaging.EmailFileAttachment>{attch});
		emails.add(email);
		list<messaging.SendEmailResult> result = messaging.sendEmail(emails);
    }
}