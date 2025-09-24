trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {

    switch on Trigger.operationType{

        when BEFORE_INSERT{
                LeadTriggerHandler.beforeInsert(Tirgger.new);
        }
        
        when AFTER_INSERT{
           	List<Task> leadTasks = new List<Task>();
            for(Lead leadRecord : Trigger.new){
                Task leadTask = new Task(Subject='New Lead Task');
                leadTasks.add(leadTask);
            }
            insert leadTasks;
        }
        
        when BEFORE_UPDATE{
            for(Lead leadRecord: Trigger.new){
                //If lead is blank then update LeadSource to Other
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }   
                
                // Lead Status will be changed to Closed only if current status is Working
                if((leadRecord.Status =='Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && (Trigger.oldMap.get(leadRecord.Id).Status == 'Open - Not Contacted') ){
                    leadRecord.Status.addError('You cannot directly close an open lead record.');
                }
            }
        }
    }
}