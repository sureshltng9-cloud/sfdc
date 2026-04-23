public virtual class Emp {
	public string myFirstName;
    public string myLastName;
    public Emp(){
        myFirstName = 'Sachin';
        myLastName =  'Tendulkar';
    }
    public Emp(string frName,string LstName){
        myFirstName = frName;
        myLastName =  LstName;
    }
    public virtual void printDetails(){
        system.debug('First Name is '+myFirstName +' Last Name is '+myLastName);
    }
    public string getFirstName(){
        return myFirstName;
    }
}