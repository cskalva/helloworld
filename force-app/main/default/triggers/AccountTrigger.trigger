trigger AccountTrigger on Account (after update) {
    
    AccountTriggerHandler.handlerAfterUpdate();
}