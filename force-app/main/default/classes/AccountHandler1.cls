public class AccountHandler1 {
    public class MyException extends Exception { }
public static void accountCreation()
{
    try{
        insertAccountRecords();
    }
    catch(MyException me)
    {
        system.debug('the error message is '+me.getmessage());
        system.debug('the error line number is'+me.getLineNumber());
        system.debug('the error cause '+me.getCause());
    }
}
    public static void insertAccountRecords()
    {
        try{
            account acc=new account();
            insert acc;
        }
        catch(DMLException e)
        {
            throw new MyException('account cannot be created'+e.getmessage());
        }
    }
}