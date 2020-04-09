public class Account2Ext {

 public Account2__c acct{get; set;}
    
    
    public PageReference save() {
      Savepoint sp = Database.setSavepoint();
      System.debug('test message2');
      try{
        
        Insert acct;
        System.debug('Account Created: '+acct.id);
        System.debug('Account Created: '+acct.id);
        Contact2__c con= new Contact2__c();
        con.name='Test Contact';
        con.status__c='Active';
        con.StartDate__c=Date.today().addDays(-2);
        con.Account2__c=acct.id;
        insert con;
        PageReference acctPage = new ApexPages.StandardController(acct).view();
        acctPage.setRedirect(true);
        return acctPage;
        }
        
        catch(DMLException e){
        Database.rollback(sp);
        ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.error,e.getDmlMessage(0) );
ApexPages.addMessage(msg);
        return null;
        }
        
    }

   
    
    public Account2Ext (){
    if(acct==null){ acct=new Account2__c();}
        System.debug('Record: '+acct);
       String id= ApexPages.currentPage().getParameters().get('id');
       If(id!=null){
       //acct=[SELECT name,   tekmind__StartDate__c FROM TestObject__c WHERE id=:id limit 1];
       
       }
    }

    public String getGreeting() {
       // return 'Hello ' + acct.name + ' (' + acct.id + ')';
       return 'hello';
    }
}