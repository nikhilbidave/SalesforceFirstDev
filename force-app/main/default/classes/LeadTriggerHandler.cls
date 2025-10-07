public class LeadTriggerHandler {
    
    public static void beforeInsert(List<Lead> newLeads){
        for(Lead leadRecord: newLeads){
            //If lead is blank then update LeadSource to Other
            if(String.isBlank(leadRecord.LeadSource)) {
                leadRecord.LeadSource = 'Other';
            }   
            
            // Validation rule for Industry Field on Insertion
            if(String.isBlank(leadRecord.Industry) && Trigger.isInsert){
                leadRecord.addError('Industry Field Cannot be Blank');
            }
        }
    }
    
    public static void afterInsert(List<Lead> newLeads){
        List<Task> leadTasks = new List<Task>();
        for(Lead leadRecord : newLeads){
            Task leadTask = new Task(Subject='New Lead Task');
            leadTasks.add(leadTask);
        }
        insert leadTasks;
    }
    
    public static void beforeUpdate(List<Lead> newLeads, Map<Id, Lead> oldLeads){
        for(Lead leadRecord: newLeads){
            //If lead is blank then update LeadSource to Other
            if(String.isBlank(leadRecord.LeadSource)){
                leadRecord.LeadSource = 'Other';
            }   
            
            // Lead Status will be changed to Closed only if current status is Working
            if((leadRecord.Status =='Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && (oldLeads.get(leadRecord.Id).Status == 'Open - Not Contacted') ){
                leadRecord.Status.addError('You cannot directly close an open lead record.');
            }
        }
    }
}