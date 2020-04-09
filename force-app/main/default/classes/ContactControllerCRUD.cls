public with sharing class ContactControllerCRUD { 
    public Contact contact{get;set;}
    public String cemail{get;set;}
   private Id contactId{get;set;}
   // public String id{get;set;}
    private ApexPages.StandardController sc; 
    public ContactControllerCRUD (ApexPages.StandardController sc) {

       // contact= new Contact();
        this.sc = sc;
        this.contactId= sc.getRecord().id;
       // contact=[select name,phone, email from Contact where id=:contactId];
 this.contact=(Contact)sc.getRecord();
this.cemail=contact.email;


    }
    
   public PageReference mysave() {
   contact.email=cemail;
    this.sc.save();
    PageReference newPage = New PageReference('/'+contactId);
    newPage.setRedirect(true);
    return newPage ;
 }


}