public class AccountTriggerHandler{

public static void handlerAfterUpdate(){

Integer count=[SELECT count() from Account];

System.debug('Account size 2--> '+count);

Account acc=[SELECT id from Account where name='University of Arizona'];

}
}