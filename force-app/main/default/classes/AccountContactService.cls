public with sharing class AccountContactService {
   
    public static void updateActiveContacts(Set<Id> accountIds){
        
        List<AggregateResult> results = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE Active__c=true and AccountId IN: accountIds GROUP BY AccountId];

        Map<Id, Account> accountsToUpdate = new List<Id, Account>();
        // Map<Id, Integer> accountIdToContactCountMap = new Map<Id, Integer>();
        for(AggregateResult ar : results){
            Id accId = (Id) ar.get('AccountId');
            Integer totalContacts = (Integer) ar.get('totalContacts');
            Account acc = new Account(Id = accId, Active_Contacts__c = totalContacts);
            accountsToUpdate.put(accId, acc);
        }    
        for (Id accId : accountIds){
            if(!accountsToUpdate.containsKey(accId)){
                accountsToUpdate.put(accId, new Account(Id = accId, Active_Contacts__c = 0));
            }
        }            
        update accountsToUpdate;   
    }
}