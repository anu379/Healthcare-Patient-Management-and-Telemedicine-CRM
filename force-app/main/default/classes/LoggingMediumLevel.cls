public class LoggingMediumLevel {
    
    public class MyException extends Exception { }
    
    public static void createAccount(String accName) {
        try {
            System.debug('Account creation started');
            
            if (String.isBlank(accName)) {
                throw new MyException('Account name is mandatory');
            }
            
            Account acc = new Account(Name = accName);
            insert acc;
            
            System.debug('The account record got created successfully: ' + acc.Id);
        } catch (Exception e) {
            System.debug(LoggingLevel.Error, 'There is an error: ' + e.getMessage());
        } finally {
            System.debug('The account creation ended');
        }
    }
}