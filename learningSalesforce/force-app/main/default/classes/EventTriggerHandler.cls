public class EventTriggerHandler {
    public static void isBeforeInsert(List<Event__c>eventList){
        for(Event__c event:eventList){
            event.Event_Status__c='Planned';
        }
    }
    public static void updateEventRegisCounts(List<Event__c>eventList){
        Set<Id>eventIds=new Set<ID>();
        for(Event__c event:eventList){
            eventIds.add(event.id);
        }
        if(!eventIDs.isEmpty()){
            for(Event__c event:[Select Id,Total_Event_Registrations__c,(Select Id from Event_Registrations__r) from Event__c where Id=:eventIDs]){
                event.Total_Event_Registrations__c=event.Event_Registrations__r.size();
            }
        }
    }
}