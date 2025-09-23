public class OpportunityController {

    public static void updateOpportunity(List<Id> oppIds)    {
        List<Opportunity> opps = [SELECT Id, Amount, Credit_Class__c FROM Opportunity WHERE Id IN: oppIds];
        for(Opportunity opp: opps){            
            if(opp.Amount > 50000) {
                opp.Credit_Class__c = 'High';
            }else if(opp.Amount > 20000 && opp.Amount< 50000) {
                opp.Credit_Class__c = 'Medium';
            }else {
                opp.Credit_Class__C = 'Low';
            }
        }
        update opps;
    }
}