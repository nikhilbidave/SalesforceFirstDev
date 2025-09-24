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
}