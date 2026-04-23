public class Apex2ExchangeCalloot {
    //5d6bfbecaeb836631da7bd96911e99e2


    public static string moneyExchange(){
        Http ht = new Http();
        httpRequest hr = new httpRequest();
        hr.setEndpoint('https://api.weatherbit.io/v2.0/current/airquality?lat=35.7721&lon=-78.63861&key=9613132e219b44119003c3b269ce1a97');
        hr.setMethod('GET');
        
        
        httpResponse hs = ht.send(hr);
        system.debug('======='+hs.getBody());
        //list<object> mp = (list<object>)json.deserializeuntyped(hs.getBody());
        return 'calling';
    }
}