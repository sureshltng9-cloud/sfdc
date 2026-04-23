@isTest
public class CaseManagerTest {
	@isTest
    public static void postTest(){
        String cId = CaseManager.postCase('New Case', 'New', 'Web', 'Medium');
        system.assert(cId != null);
        system.debug('========Case Id Is========='+cId);
    }
    @isTest
    public static void getTest(){
        String caseId = getCase();
        RestRequest rq = new RestRequest();
        rq.httpMethod = 'GET';
        rq.requestURI = 'https://webcomponent2-dev-ed.develop.my.salesforce.com/services/apexrest/Cases/'+caseId;
        RestContext.request = rq;
       	Case c = CaseManager.getCase();
        system.assertEquals('New', c.Status);
    }
    @isTest
    public static void deleteTest(){
        String caseId = getCase();
        RestRequest rq = new RestRequest();
        rq.httpMethod = 'DELETE';
        rq.requestURI = 'https://webcomponent2-dev-ed.develop.my.salesforce.com/services/apexrest/Cases/'+caseId;
        RestContext.request = rq;
        CaseManager.deleteCase();
        list<Case> cList = [SELECT Id FROM Case WHERE Id =:caseId];
        system.debug('======Case===='+cList.isEmpty());
        system.assertEquals(0, cList.size());
    }
    @isTest
    public static void updateTest(){
        String caseId = getCase();
        RestRequest rq = new RestRequest();
        rq.httpMethod = 'PATCH';
        rq.addHeader('content-type', 'application/json');
        rq.requestURI = 'https://webcomponent2-dev-ed.develop.my.salesforce.com/services/apexrest/Cases/'+caseId;
        rq.requestBody = Blob.valueOf('{"Origin":"Email"}');
        RestContext.request = rq;
        String csId = CaseManager.updateCase();
        Case c = [SELECT Id,Origin,Status FROM Case WHERE Id =: csId];
        system.assertEquals('Email', c.Origin);
    }
    @isTest
    public static void upsertTest(){
        string cId1 = CaseManager.upsertCase('Test Subject', 'New', 'Email', 'Medium', null);
        Case c1 = [SELECT Id,Origin,Priority FROM Case WHERE Id =: cId1];
        system.assertEquals('Medium', c1.Priority);
        
        string cId2 = CaseManager.upsertCase('Test Subject1', 'New', 'Email', 'High', c1.Id);
        Case c2 = [SELECT Id,Origin,Priority FROM Case WHERE Id =: cId2];
        system.assertEquals('High', c2.Priority);
    }
    public static Id getCase(){
        Case c = new Case();
        c.Status = 'New';
        c.Priority = 'High';
        c.Origin = 'Web';
        c.Subject = 'RestResource';
        insert c;
        return c.Id;
    }
}