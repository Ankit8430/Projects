trigger EventTrigger on Event__c (before insert,after insert,after delete,after undelete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            EventTriggerHandler.isBeforeInsert(Trigger.new);
        }
    }

}