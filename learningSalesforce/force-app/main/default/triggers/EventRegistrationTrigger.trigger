trigger EventRegistrationTrigger on Event_Registrations__c (after insert,after delete,after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUndelete || Trigger.isDelete){
            EventRegistrationTriggerHandler.updateEventRegisCounts(Trigger.new);
        }
    }
}