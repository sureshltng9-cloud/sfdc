public class AnimalsCallouts {
    public static HttpResponse makeGetCallout(){
        http ht =new http();
        HttpRequest rq = new HttpRequest();
        rq.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        rq.setMethod('GET');
        HttpResponse rsp = ht.send(rq);
        if(rsp.getStatusCode() == 200){
            map<string,object> mp = (map<string,object>)JSON.deserializeUntyped(rsp.getBody());
        	for(string s : mp.keySet()){
            	system.debug('=======Values======='+mp.get(s));
        	}
        	system.debug('=======getStatus======='+rsp.getStatus());
        	system.debug('=======getStatusCode======='+rsp.getStatusCode());
        	system.debug('=======getHeader======='+rsp.getHeader('Content-Type'));
        }
        return rsp;
    }
    public static HttpResponse makePostCallout(){
        http ht =new http();
        HttpRequest rq = new HttpRequest();
        rq.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        rq.setMethod('POST');
        rq.setHeader('Content-Type', 'application/json;charset=UTF-8');
        rq.setBody('{"name":"mighty moose"}');
        HttpResponse rsp = ht.send(rq);
        if(rsp.getStatusCode() != 200){
            map<string,object> mp = (map<string,object>)JSON.deserializeUntyped(rsp.getBody());
        	for(string s : mp.keySet()){
                system.debug('=======Key======='+s);
            	system.debug('=======Values======='+mp.get(s));
        	}
        	system.debug('=======getStatus======='+rsp.getStatus());
        	system.debug('=======getStatusCode======='+rsp.getStatusCode());
        	system.debug('=======getHeader======='+rsp.getHeader('Content-Type'));
        }
        return rsp;
    }
}