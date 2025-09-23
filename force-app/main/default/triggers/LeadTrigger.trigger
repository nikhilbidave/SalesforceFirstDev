trigger LeadTrigger on Lead (before insert, before update, after update) {

    switch on Trigger.operationType{

        when BEFORE_INSERT{
            for(Lead leadRecord: Trigger.new){
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
        
        when AFTER_UPDATE{
            // Future scope for after update operations
        }
    }

}