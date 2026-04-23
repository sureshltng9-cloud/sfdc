@isTest
public class AnimalsHttpCalloutMock implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest rq){
        HttpResponse rsp = new HttpResponse();
        rsp.setHeader('content-type', 'application/json');
        rsp.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        rsp.setStatusCode(200);
        return rsp;
    }
    
    @isTest
    public static void unitTest(){
        test.setMock(httpCalloutMock.class, new AnimalsHttpCalloutMock());
        HttpResponse rs = AnimalsCallouts.makePostCallout();
        system.assertEquals('application/json', rs.getHeader('content-type'));
        string expected = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        string actual = rs.getBody();
        system.assertEquals(expected, actual);
        system.assertEquals(200, rs.getStatusCode());
    }
}