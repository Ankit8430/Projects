trigger OpportunityTrigger on Opportunity (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            OpportunityTriggerHandler.updateAnnualRevenue(Trigger.new,null);
            OpportunityTriggerHandler.updateTotalClosedWon(Trigger.new,null);
        }
        if(Trigger.isUpdate){
            OpportunityTriggerHandler.updateAnnualRevenue(Trigger.new,Trigger.old);
            OpportunityTriggerHandler.updateTotalClosedWon(Trigger.new,Trigger.old);
        }
        if(Trigger.isDelete){
            OpportunityTriggerHandler.updateAnnualRevenue(null,Trigger.old);
            OpportunityTriggerHandler.updateTotalClosedWon(null,Trigger.old);
        }
    }
}