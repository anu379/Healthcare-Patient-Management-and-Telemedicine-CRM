public class UpdateConatctPhone {
public static void updateContact()
{
    list<contact> updateContactlist=new list<contact>();
    list<contact> contactList=[select id,name from contact where phone!=null];
    for(contact con:contactList)
    {
        con.phone='9898888888';
        updateContactlist.add(con);
    }
    try
    {
        update updateContactlist;
    }
    catch(DMLexception e)
    {
        system.debug('there is an error'+e.getmessage());
        system.debug('Line number'+e.getLineNumber());
        system.debug('the cause is'+e.getCause());
    }
    finally
    {
        system.debug('the failure and the success is handleed');
    }
}
}