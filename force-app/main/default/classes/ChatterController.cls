public with sharing class ChatterController {
    
    public String collaborationGroupId {get;set;}
    public ChatterController() {

        CollaborationGroup cg = [Select Id, Name from CollaborationGroup where name='OrderGroup'];
        collaborationGroupId = cg.Id;   
    }
}