public class EmailMessageCopyToCaseCommentsTrigger
{
    public static void copyEmailMessagesToCaseComments(List<EmailMessage> emails)
    {
    	List<CaseComment> comments = new List<CaseComment>();
        for (EmailMessage email:emails)
        {
            Id caseId = email.ParentId;
            CaseComment comment = new CaseComment(ParentId=caseId);
            String header = 'From: '+ email.FromName + ' <' + email.FromAddress + '>\n';
            header += 'To: '+ email.ToAddress + '\n';
            header += email.CcAddress!=null?'CC: '+ email.CcAddress + '\n\n':'\n';
            if (email.TextBody!=null) {
            	comment.CommentBody = header + email.TextBody;
            } else if (email.HtmlBody!=null) {
            	comment.CommentBody = header + email.HtmlBody.replaceAll('\\<.*?>','');
            }
            
            comments.add(comment);
        }
        
        if (!comments.isEmpty())
        {
        	insert comments;
        }
    }
    
    public static testMethod void testCopyEmailMessagesToCaseComments()
    {
        Case c1 = new Case(Subject='blah');
        insert c1;
        
        List<EmailMessage> emails = new List<EmailMessage>();
        emails.add(new EmailMessage(ParentId=c1.Id,FromAddress='yo@yo.com',FromName='Yo',Subject='Subject',TextBody='TextBody',ToAddress='to@to.com'));
        emails.add(new EmailMessage(ParentId=c1.Id,FromAddress='yo@yo.com',FromName='Yo',Subject='Subject',HtmlBody='<b>HtmlBody</b><i>more</i>',ToAddress='to@to.com'));
        insert emails;
        
        List<CaseComment> comments = [select Id,CommentBody from CaseComment where ParentId=:c1.Id];
        System.assert(comments.size()==2);
        
        for (CaseComment comment:comments) {
        	System.debug(comment.CommentBody);
        	System.assert(comment.CommentBody!=null && comment.CommentBody!='');
        }
    }
}