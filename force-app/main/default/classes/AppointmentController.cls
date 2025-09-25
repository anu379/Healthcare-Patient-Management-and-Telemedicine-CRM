public with sharing class AppointmentController {
    @AuraEnabled(cacheable=true)
    public static List<Appointment__c> getTodayAppointments() {
        return [SELECT Id, Patient__c, Status__c, Appointment_Date__c
                FROM Appointment__c
                WHERE Appointment_Date__c = TODAY];
    }
}
