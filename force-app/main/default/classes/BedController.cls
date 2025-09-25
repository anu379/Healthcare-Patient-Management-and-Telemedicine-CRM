public with sharing class BedController {
    @AuraEnabled(cacheable=true)
    public static List<Bed_Availability__c> getBeds() {
        return [SELECT Id, Bed_Number__c, Bed_Status__c FROM Bed_Availability__c];
    }
}
