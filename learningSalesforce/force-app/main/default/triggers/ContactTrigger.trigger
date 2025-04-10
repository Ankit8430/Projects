trigger ContactTrigger on Contact (after insert,after update,after delete){
    if(Trigger.isAfter && Trigger.isUpdate){
        //ContactTriggerHandler.updateAccountContry(Trigger.new,Trigger.oldMap);
    }
    /*if(Trigger.isAfter){
        if(Trigger.isInsert){
            ContactTriggerHandler.updateTotalContact(Trigger.new,null);
        }
        if(Trigger.isUpdate){
            ContactTriggerHandler.updateTotalContact(Trigger.new,Trigger.old); 
        }
        if(Trigger.isDelete){
             ContactTriggerHandler.updateTotalContact(null,Trigger.old);
        }
    }*/
}