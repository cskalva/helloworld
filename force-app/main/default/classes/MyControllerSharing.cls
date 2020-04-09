public with sharing class MyControllerSharing {
    
    public MyControllerSharing() {        
    }
    
    public List<Account2__c> getAccount2s() {        
        List<Account2__c> accounts=[SELECT Name From Account2__c];        
        return accounts;
    }    
}