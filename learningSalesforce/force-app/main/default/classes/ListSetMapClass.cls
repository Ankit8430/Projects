public class ListSetMapClass {
    public static void listSetFunction(){
        List<Account>accList=[Select Id from Account];
        Set<Id>accIds=new Set<Id>();
        if(!accList.isEmpty()){
            for(Account acc:[Select Id from Account]){
                accIds.add(acc.id);
            }
        }
        if(!accIds.isEmpty()){
            System.debug(accIds);
        }
    }
    public static void listSetMapFunction(){
        List<Account>accList=[Select Id,Name from Account];
        Set<ID>accIds=new Set<Id>();
        if(!accList.isEmpty()){
            Map<Id,Account>accMap=new Map<Id,Account>(accList);
            for(Account acc:accList){
                accIds.add(acc.id);
            }
            if(!accIds.isEmpty()){
                for(Id i:accIds){
                    if(accMap.containsKey(i)){
                        System.debug('Map =>'+accMap.get(i));
                    }
                }
            }
        }
    }
}