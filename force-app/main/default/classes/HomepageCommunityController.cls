public with sharing class HomepageCommunityController {
    public String firstName {get; set;}
    public String lastName {get; set;}

    public HomepageCommunityController() {
        firstName = '';
        lastName = '';
    }

    public void sendLead() {
        if (lastName != '' && firstName != '') {
            Lead newLead = new Lead(FirstName = firstName, LastName = lastName, Company = 'From Community');
            insert newLead;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Confirm, ' Thank you!. '));       
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, ' Enter info in all fields please. '));
        }
    }
}