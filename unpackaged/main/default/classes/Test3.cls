public with sharing class Test3 {
    public string accName;
    public Test3() {
        system.debug('======Constructor is invoked=======');
    }
    public void getAccounts(){
        List<Account> acclist = new List<Account>([SELECT Name,Rating,Industry FROM Account]);
        accName = acclist.get(0).Rating;
    }
    public static string mth(){
        Http ht = new Http();
        HttpRequest rs = new HttpRequest();
        rs.setEndpoint('https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m');
        rs.setMethod('GET');
        HttpResponse rsp = ht.send(rs);
        map<string,object> reslt = (map<string,object>)JSON.deserializeUntyped(rsp.getBody());
        system.debug('==================Keys========='+reslt.keySet());
        system.debug('==================Keys========='+reslt.values());
        System.debug('============='+rsp.getBody());
        return 'hello' ;
    }
}