@restResource(urlMapping='/creatingAccounts/*')
global class ResetSerVicePostman {
    @httpGet
    global static string accGet(){
        restRequest rq = RestContext.request;
        system.debug('==========='+rq.requestBody.toString());
        exm obj= (exm)JSON.deSerialize(rq.requestBody.toString(),exm.class);
        
            system.debug('===='+obj.Id);
            system.debug('===='+obj.testing);
        
        return 'Responsne from Class';
    }
    global class exm{
        global string testing{get;set;}
        global string Id {get;set;}
        global string phone {get;set;}
    }
    
    @httpPost
    global static string createAcc(){
        RestRequest rs = RestContext.Request;
        system.debug('resquest body from Post======'+rs.requestBody.tostring());
        JSONParser parser = JSON.createParser(rs.requestBody.tostring());
        exm obj= (exm)JSON.deSerialize(rs.requestBody.toString(),exm.class);
            system.debug('===='+obj.Id);
            system.debug('===='+obj.phone);
        if(obj != null){
            Account acc = new Account(Id =obj.Id,phone=obj.phone);
            upsert acc;
        }
        return 'created';
    }
}