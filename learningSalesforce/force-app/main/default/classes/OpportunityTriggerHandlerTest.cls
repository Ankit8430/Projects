@isTest
public class OpportunityTriggerHandlerTest {
	@testSetup
    private static void testSetup(){
        Account acc=new Account(Name='Test');
        insert acc;
        Account acc1=new Account(Name='Test1',Total_Closed_Won__c=-2);
        insert acc1;
        List<Opportunity>oppList=new List<Opportunity>();
        oppList.add(new Opportunity(Name='Opp 1',StageName='Closed Won',CloseDate=System.today(),AccountId=acc.id,Amount=1000));
        oppList.add(new Opportunity(Name='Opp 2',StageName='Closed Won',CloseDate=System.today(),AccountId=acc.id,Amount=1000));
        oppList.add(new Opportunity(Name='Opp 3',StageName='Closed Won',CloseDate=System.today(),AccountId=acc.id,Amount=1000));
        oppList.add(new Opportunity(Name='Opp 4',StageName='Closed Won',CloseDate=System.today(),AccountId=acc1.id,Amount=1000));
        insert oppList;
    }
    @isTest
    private static void testMethodInsert(){
        List<Opportunity>oppList=[Select Id,Amount from Opportunity where StageName='Closed Won'];
        Account acc=[Select Id,AnnualRevenue,Total_Closed_Won__c from Account where Name='Test'];
        System.assertEquals(acc.AnnualRevenue,3000);
        System.assertEquals(acc.Total_Closed_Won__c,3);
    }
    @isTest
    private static void testMethodUpdaet(){
        List<Opportunity>oppList=[Select Id,Amount,Name from Opportunity where StageName='Closed Won'];
        for(Opportunity opp:oppList){
            opp.Amount=2000;
            if(opp.Name=='Opp 3'){
                opp.AccountId=null;
            }
        }
        update oppList;
        Account acc=[Select Id,AnnualRevenue,Total_Closed_Won__c from Account where Name='Test'];
        System.assertEquals(acc.AnnualRevenue,4000);
         System.assertEquals(acc.Total_Closed_Won__c,2);
    }
    @isTest
    private static void testMethodDelete(){
        List<Opportunity>oppList=[Select Id from Opportunity where StageName='Closed Won'];
        delete oppList;
        Account acc=[Select Id,AnnualRevenue,Total_Closed_Won__c from Account where Name='Test'];
        System.assertEquals(acc.AnnualRevenue,0);
         System.assertEquals(acc.Total_Closed_Won__c,0);
    }
}