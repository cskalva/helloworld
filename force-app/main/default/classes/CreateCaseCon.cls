public with sharing class CreateCaseCon {

    public Case theCase {get; set;}
    public String lastError {get; set;}

    public createCaseCon() {
        theCase = new Case();
        lastError = '';
    }
      
    public PageReference save() {
        createNewCase();
        theCase = new Case();
        
        lastError = 'ok';

        return System.currentPageReference();                
    }
      
     private void createNewCase() {      
        try {
            insert theCase;

            FeedItem post = new FeedItem();
            post.ParentId = ApexPages.currentPage().getParameters().get('id');
            post.Body = 'Created a case';
            post.type = 'LinkPost'; 
            post.LinkUrl = '/' + theCase.id;
            post.Title = theCase.Subject;
            insert post;
        } catch(System.Exception ex){
            lastError = ex.getMessage();
        }
    }  
}