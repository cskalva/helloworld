trigger EmailMessageCopyToCaseComments on EmailMessage (after insert) {
	EmailMessageCopyToCaseCommentsTrigger.copyEmailMessagesToCaseComments(Trigger.new);
}