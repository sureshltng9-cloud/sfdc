public class PassParamCon {

    public String myOutput { get; set; }
    
    public String myInput { get; set; }

    public PageReference submit() {
        myOutput = myInput;
        return null;
    }

}