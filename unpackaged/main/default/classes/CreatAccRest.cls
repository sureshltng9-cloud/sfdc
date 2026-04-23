@RestResource(urlMapping='/accService/*')
global class CreatAccRest {
    @httpPost
    global static string creatAccs(){
        RestRequest rq = RestContext.request;
        string st = rq.requestURI.substring(rq.requestURI.lastIndexof('/')+1);
        system.debug('========substring========='+st);
        map<string,object> mp = (map<string,object>)JSON.deSerializeUntyped(rq.requestBody.toString()); 
        system.debug('========Map========='+mp);
        nm r= (nm)JSON.deserialize(rq.requestBody.toString(),nm.class);
        system.debug('========wrps1========='+JSON.deserialize(rq.requestBody.toString(),nm.class));
       
        return 'Successfully Executed';
    }
    global class wrp{
        global string name {get;set;}
        global string rating {get;set;}
    }
     global class nm{
            global list<wrp> wr {get;set;}  
     }

}