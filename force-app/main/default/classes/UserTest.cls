@isTest 
private class UserTest {
    static testMethod void validateHelloWorld() {
       List<User> users=[Select Id FROM User];
       System.debug('users count==> '+users.size());
       
   User u      = new User();
    u.UserName  = 'chandra.kalva-ext@jci.com.enhance2';
    u.Email     = 'FirstName.LastName@company.com';
    u.FirstName = 'FirstName';
    u.LastName  = 'LastName';
    u.Alias     = 'flast';
    u.ProfileId = '00eo0000000O8IO';

    u.TimeZoneSidKey = 'GMT';
    u.LocaleSidKey = 'en_US';
    u.EmailEncodingKey = 'ISO-8859-1';
    u.LanguageLocaleKey = 'en_US';
    u.UserPermissionsMobileUser = false;

    insert u;
        
    users=[Select Id FROM User];
    System.debug('users count==> '+users.size());
    }
}