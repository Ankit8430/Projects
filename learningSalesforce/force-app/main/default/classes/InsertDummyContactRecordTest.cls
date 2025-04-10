@isTest
public class InsertDummyContactRecordTest {
	@isTest
    private static void testMethod1(){
		Test.startTest();
        InsertDummyContactRecord idcr=new InsertDummyContactRecord('Test','Contact');
        Id jobId=System.enqueueJob(idcr);
        System.debug('Job Id =:'+jobId);
        Test.stopTEst();
    }
}