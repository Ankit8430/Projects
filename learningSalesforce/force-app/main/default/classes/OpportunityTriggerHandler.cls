public class OpportunityTriggerHandler {
    public static void updateAnnualRevenue(List<Opportunity>newOpps,List<Opportunity>oldOpps){
        Map<Id,Decimal>updateAnnualRevenueMap=new Map<Id,Decimal>();
        if(newOpps!=null){
            for(Opportunity opp:newOpps){
                if(opp.AccountId!=null && opp.Amount!=null){
                    if(!updateAnnualRevenueMap.containsKey(opp.AccountId)){
                        updateAnnualRevenueMap.put(opp.AccountId,0);
                    }
                    updateAnnualRevenueMap.put(opp.AccountId,updateAnnualRevenueMap.get(opp.AccountId)+opp.Amount);
                }
            }
        }
        if(oldOpps!=null){
            for(Opportunity opp:oldOpps){
                if(opp.AccountId!=null && opp.Amount!=null){
                    if(!updateAnnualRevenueMap.containsKey(opp.AccountId)){
                        updateAnnualRevenueMap.put(opp.AccountId,0);
                    }
                    updateAnnualRevenueMap.put(opp.AccountId,updateAnnualRevenueMap.get(opp.AccountId)-opp.Amount);
                }
            }
        }
        List<Account>updateAccounts=new List<Account>();
        if(!updateAnnualRevenueMap.isEmpty()){
            Map<Id,Account>exitingAccounts=new Map<Id,Account>([
                Select Id,AnnualRevenue from Account where ID IN:updateAnnualRevenueMap.keySet()
            ]);
            for(Id accountId :updateAnnualRevenueMap.keySet()){
                Decimal newAnnualRevenue=updateAnnualRevenueMap.get(accountId);
                Account acc=exitingAccounts.get(accountId);
                if(acc!=null){
                    acc.AnnualRevenue=(acc.AnnualRevenue!=null?acc.AnnualRevenue:0)+newAnnualRevenue;
                    updateAccounts.add(acc);
                }
            }
            if(!updateAccounts.isEmpty()){
                update updateAccounts;
            }
        }
    }
    public static void updateTotalClosedWon(List<Opportunity>newOpps,List<Opportunity>oldOpps){
        Map<Id,Decimal>updateTotalClosedWonMap=new Map<Id,Decimal>();
        if(newOpps!=null){
            for(Opportunity opp:newOpps){
                if(opp.AccountId!=null && opp.StageName=='Closed Won'){
                    if(!updateTotalClosedWonMap.containsKey(opp.AccountId)){
                        updateTotalClosedWonMap.put(opp.AccountId,0);
                    }
                    updateTotalClosedWonMap.put(opp.AccountId,updateTotalClosedWonMap.get(opp.AccountId)+1);
                }
            }
        }
        if(oldOpps!=null){
            for(Opportunity opp:oldOpps){
                if(opp.AccountId!=null && opp.StageName=='Closed Won'){
                    if(!updateTotalClosedWonMap.containsKey(opp.AccountId)){
                        updateTotalClosedWonMap.put(opp.AccountId,0);
                    }
                    updateTotalClosedWonMap.put(opp.AccountId,updateTotalClosedWonMap.get(opp.AccountId)-1);
                }
            }
        }
        List<Account>updateAccounts=new List<Account>();
        if(!updateTotalClosedWonMap.isEmpty()){
            Map<Id,Account>existingAccounts=new Map<Id,Account>([
                Select Id,Total_Closed_Won__c from Account where ID IN:updateTotalClosedWonMap.keySet()
            ]);
            for(Id accountId:updateTotalClosedWonMap.keySet()){
                Decimal newTotalClosedWon=updateTotalClosedWonMap.get(accountId);
                Account acc=existingAccounts.get(accountId);
                if(acc!=null){
                    acc.Total_Closed_Won__c=(acc.Total_Closed_Won__c!=null?acc.Total_Closed_Won__c:0)+newTotalClosedWon;
                    if(acc.Total_Closed_Won__c<0){
                        acc.Total_Closed_Won__c=0;
                    }
                    updateAccounts.add(acc);
                }
            }
            if(!updateAccounts.isEmpty()){
                update updateAccounts;
            }
        }
    }
}