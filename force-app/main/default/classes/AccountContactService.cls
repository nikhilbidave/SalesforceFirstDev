public with sharing class AccountContactService {
   
    public static void updateActiveContacts(Set<Id> accountIds){
        
        List<AggregateResult> results = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE Active__c=true and AccountId IN: accountIds GROUP BY AccountId];

        List<Account> accountsToUpdate = new List<Account>();

        for(AggregateResult ar : results){
            Id accId = (Id) ar.get('AccountId');
            Integer totalContacts = (Integer) ar.get('totalContacts');
            Account acc = new Account(Id = accId, Active_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }                
        update accountsToUpdate;
    
    }
}