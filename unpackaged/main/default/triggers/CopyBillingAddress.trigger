trigger CopyBillingAddress on Account (before insert) {
    for(Account a : trigger.new){
        if(a.BillingStreet != null && a.BillingState != null && a.BillingCity != null && a.BillingCountry !=null){
            a.ShippingStreet = a.BillingStreet;
            a.ShippingState = a.BillingState;
            a.ShippingCity = a.BillingCity;
            a.ShippingCountry = a.BillingCountry;
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}