@isTest
public class UpdateAccountAddressOnContactScheTest {
	@isTest
    private static void testMethod1(){
        List<Account>accList=new List<Account>();
        for(Integer i=0;i<10;i++){
            accList.add(new Account(Name='Test'+i,BillingCity='BillingCity'+i,BillingState='BillingState'+i,BillingPostalCode='BillingPostalCode'+i,
                                   BillingStreet='BillingStreet'+i));
        }
        Database.SaveResult[] srList=DAtabase.insert(accList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        List<Contact>conList=new List<Contact>();
        for(Account acc:accList){
            conList.add(new Contact(LastName='Test'+acc.Name,AccountId=acc.id));
        }
        srList=Database.insert(conList,false);
        for(dAtabase.SaveREsult sr:srList){
            if(sr.isSuccess())
                System.debug('Id =:'+sr.getId());
            else
                System.debug(LoggingLevel.Error,'Error =:'+sr.getErrors()[0].getMessage());
        }
        Test.startTest();
        UpdateAccountAddressOnContactSchedule uac=new UpdateAccountAddressOnContactSchedule();
        String sch='0 0 0 ? * * *';
        Id jobId=System.schedule('uac1',sch,uac);
        System.debug('jobId =:'+jobId);
        Test.stopTest();
    }

}