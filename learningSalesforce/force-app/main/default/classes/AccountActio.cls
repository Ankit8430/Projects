public class AccountActio {
	@InvocableMethod
    public static List<Decimal> updateAnnualReveue(List<Id>ids){
		List<Opportunity>oppList=[Select Id,Amount,AccountId from Opportunity where Id=:ids];
       	List<Account>accList=[Select Id,AnnualRevenue from Account where Id=:oppList[0].AccountId];
        
       	List<Decimal>updateAnnualRevenue=new List<decimal>();
		accList[0].AnnualRevenue=accList[0].AnnualRevenue+oppList[0].Amount;
        update accList;
        updateAnnualRevenue.add(accList[0].AnnualRevenue);
        return updateAnnualRevenue;
    }
}