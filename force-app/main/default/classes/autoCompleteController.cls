global class autoCompleteController {

    public String objectname { get; set; }
    @RemoteAction
    global static SObject[] findSObjects(string obj, string qry, string addFields) {
    
    System.debug(' In findSObjects');
       String query = 'select name from account where Name like \'' + String.escapeSingleQuotes(qry) + '%\'';
        query += ' order by Name limit 20';
        System.debug('Query '+query );
        List<sObject> L = new List<sObject>();
        try {
            L = Database.query(query );
        }
        catch (QueryException e) {
            return null;
        }
        return L;
   }
}