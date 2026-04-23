public class UserInf {

    public String TimeZone { get; set; }

    public string TZ{ get; set; }

    public String Email { get; set; }

    public String UserName { get; set; }
    
    public UserInf(){
        UserName = userInfo.getName();
        Email = userInfo.getUserEmail();
        TZ  = userInfo.getOrganizationName();
    }
}