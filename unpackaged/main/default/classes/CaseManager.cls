@RestResource(urlMapping = '/Cases/*')
global class CaseManager {
	@httpGet
    global static Case getCase(){
        RestRequest rq = RestContext.request;
        string caseId = rq.requestURI.subString( rq.requestURI.lastIndexOf('/')+1);
        Case c = [SELECT CaseNumber,Subject,Status,Origin,Priority FROM Case WHERE Id =:caseId LIMIT 1];
        return c;
    }
    @httpPost
    global static Id postCase(String subject, String status,String origin, String priority){
        Case c = new Case(Subject = subject,Status = status,Origin = origin, Priority = priority);
        insert c;
        return c.Id;
    }
    @httpDelete
    global static void deleteCase(){
        RestRequest rq = RestContext.request;
        String CaseId = rq.requestURI.subString(rq.requestURI.lastIndexOf('/')+1);
		Case c = [SELECT CaseNumber,Subject,Status,Origin,Priority FROM Case WHERE Id =:CaseId LIMIT 1];     
        delete c;
    }
    @httpPut
    global static Id upsertCase(String subject, String status,String origin, String priority, String id){
        Case c = new Case();
        c.Subject = subject;
        c.Status = status;
        c.Origin = origin;
        c.Priority = priority;
        c.Id = id;
        upsert c;
        return c.Id;
    }
    @httpPatch
    global static Id updateCase(){
        RestRequest rs = RestContext.request;
        string csId = rs.requestURI.subString(rs.requestURI.lastIndexOf('/')+1);
        map<string,object> mp = (map<string,object>)JSON.deserializeUntyped(rs.requestBody.toString());
        Case cs = [SELECT Id FROM Case WHERE Id =: csId];
        for(string s : mp.keySet()){
            cs.put(s,mp.get(s));
        }
        update cs;
    	return cs.Id;
    }
}