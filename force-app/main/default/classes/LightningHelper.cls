public class LightningHelper {
    @AuraEnabled
    public static List<Account> getAccounts() {
        return [Select Name, Id, (Select Name, Id From Contacts) from Account Order By Name DESC Limit 20];
    }
}