public with sharing class ContactController { 
    public List<Contact> contacts{get;set;} 
    public ContactController () {

        contacts= [SELECT id, name, ownerid from Contact] ;




    } 

}