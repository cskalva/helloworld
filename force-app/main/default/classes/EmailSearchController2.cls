public class EmailSearchController2 {
    public String Email {get; set;}
    public List<Case> contactList {get; set;}
      
    public void doSearch() {
        contactList = Database.query('SELECT id, subject, Contact.name FROM Case WHERE subject LIKE \'%' + Email + '%\'');
    }
}