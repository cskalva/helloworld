global class scheduledMerge implements Schedulable {
   global void execute(SchedulableContext SC) {
   List<Account > acclist = [Select id,name , CreatedDate , lastModifiedDate from Account limit 10];
string header = 'Record Id, Name , Created Date, Modified Date \n';
string finalstr = header ;
for(Account a: acclist)
{
       string recordString = '"'+a.id+'","'+a.Name+'","'+a.CreatedDate+'","'+a.LastModifiedDate +'"\n';
       finalstr = finalstr +recordString;
}
Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
blob csvBlob = Blob.valueOf(finalstr);
string csvname= 'Account.csv';
csvAttc.setFileName(csvname);
csvAttc.setBody(csvBlob);
csvAttc.setContentType('text/csv');
Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
String[] toAddresses = new list<string> {'chandra.kalva@solutionstar.com'};
String subject ='Account List';
email.setSubject(subject);
email.setToAddresses( toAddresses );
email.setPlainTextBody('Account CSV ');
email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
   }
}