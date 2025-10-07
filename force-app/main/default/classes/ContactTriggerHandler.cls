public class ContactTriggerHandler {
    
    public static void afterInsert(List<Contact> newContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: newContacts){
            if(String.isNotBlank(con.AccountId)){
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContacts(accountIds);
    }

    public static void afterUpdate(List<Contact> newContacts, Map<Id, Contact> oldContacts){

        Set<Id> accountIds = new Set<Id>();
        for(Contact con: newContacts){
            if(String.isNotBlank(con.AccountId) && (con.Active__c != oldContacts.get(con.Id).Active__c)){
                accountIds.add(con.AccountId);
            } else if(con.AccountId != oldContacts.get(con.Id).AccountId){
                accountIds.add(oldContacts.get(con.Id).AccountId);
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContacts(accountIds);
    }

    public static void afterDelete(List<Contact> oldContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: oldContacts){
            if(String.isNotBlank(con.AccountId)){
                accountIds.add(con.AccountId);
            } 
        }
        AccountContactService.updateActiveContacts(accountIds);
    }
        
    public static void afterUndelete(List<Contact> newContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: newContacts){
            if(String.isNotBlank(con.AccountId)){
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContacts(accountIds);
    }
}