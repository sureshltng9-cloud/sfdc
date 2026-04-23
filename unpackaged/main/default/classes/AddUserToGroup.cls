public class AddUserToGroup {
    public AddUserToGroup(){
        system.debug('========Constructor is invoked=========');
    }
    public static void AddToGroup(){
        list<User> urs = [SELECT Id,Name,Profile.Name FROM User WHERE Profile.Name ='System Administrator'];
        Group gp = [SELECT Id,Name FROM Group WHERE Type='Regular' AND Name='Custom Group' LIMIT 1];
        list<GroupMember> gMember = new list<GroupMember>();
        if(urs != null && gp != null){
            for(User u : urs){
                GroupMember gm = new GroupMember();
                gm.UserORGroupId = u.Id;
                gm.GroupId = gp.Id;
                gMember.add(gm);
                system.debug('=====Inside Sucessfully========');
                system.debug('==========Testing Console===========');
            }
        }
        if(gMember != null && gMember.size() > 0){
            insert gMember;
            system.debug('=====Member Added Sucessfully========'+gMember);
        }
    }
}