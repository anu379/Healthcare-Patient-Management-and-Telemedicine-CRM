public with sharing class PatientController {
    @AuraEnabled
    public static List<Patients__c> searchPatients(String searchKey) {
        // Return matching patients based on First Name
        if(String.isBlank(searchKey)) {
            return new List<Patients__c>();
        }
        return [
            SELECT Id, First_Name__c, Last_Name__c, Status__c
            FROM Patients__c
            WHERE First_Name__c LIKE :('%' + searchKey + '%')
            ORDER BY First_Name__c ASC
        ];
    }
}
