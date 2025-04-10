trigger AccountTrigger on Account (after insert) {
    Set<Id>accIds=new Set<Id>();
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            for(Account acc:Trigger.new){
                accIds.add(acc.id);
            }
            AccountTriggerHandler.updateAccountPhone(accIds);
        }
    }
}