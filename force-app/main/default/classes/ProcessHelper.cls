global class ProcessHelper
{
    @InvocableMethod(label='Set Sample Field 1' description='Sets sample field 1 to "Action Invoked!"')
    global static void SetSampleField1(List<Account> accts)
    {
        Set<Id> acctIds = new Map<Id, Account>(accts).keySet();
    
        accts = [SELECT Id, Phone FROM Account WHERE Id IN :acctIds];
        
}

}