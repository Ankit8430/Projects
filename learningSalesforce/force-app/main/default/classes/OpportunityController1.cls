public with sharing class OpportunityController1 {
    @AuraEnabled 
    public static List<Opportunity> getOpportunities(){
        return [Select StageName from Opportunity];
    }
}