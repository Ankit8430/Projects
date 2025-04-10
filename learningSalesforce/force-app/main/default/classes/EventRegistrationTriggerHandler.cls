public class EventRegistrationTriggerHandler {
	public static void updateEventRegisCounts(List<Event_Registrations__c>eventRegList){
		Map<Id,Decimal>eventMap=new Map<Id,Decimal>();
        for(Event_Registrations__c event:eventRegList){
            if(event.Event__c!=null){
                Decimal total=1;
                if(eventMap.containsKey(event.Event__c)){
                    total=eventMap.get(event.Event__c);
                }
                eventMap.put(event.Event__c,total);
            }
        }
        if(!eventMap.isEmpty()){
            List<Event__c>eventList=new List<event__c>();
            for(Event__c event:[Select Id from Event__c where Id=:eventMap.KeySet()]){
                eventList.add(new Event__c(Id=event.id,Total_Event_Registrations__c=eventMap.get(event.Id)));
            }
            update eventList;
        }
    }
}