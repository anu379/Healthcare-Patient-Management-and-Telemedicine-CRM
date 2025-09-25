public with sharing class PatientAPIService {

    @AuraEnabled(cacheable=false)
    public static List<Patients__c> getPatientsFromAPI() {
        List<Patients__c> patientList = new List<Patients__c>();

        try {
            // Create request
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://example.com/api/patients'); // replace with your API URL
            req.setMethod('GET');

            // Send request
            Http http = new Http();
            HttpResponse res = http.send(req);

            System.debug('API Response: ' + res.getBody());

            // Optional: parse JSON response and create Patients__c records
            if(res.getStatusCode() == 200) {
                List<Object> records = (List<Object>) JSON.deserializeUntyped(res.getBody());
                for(Object rec : records){
                    Map<String,Object> r = (Map<String,Object>) rec;
                    Patients__c p = new Patients__c();
                    p.First_Name__c = (String) r.get('firstName');
                    p.Last_Name__c = (String) r.get('lastName');
                    p.Status__c = (String) r.get('status');
                    patientList.add(p);
                }
            }

        } catch(Exception e) {
            System.debug('Error calling API: ' + e.getMessage());
        }

        return patientList;
    }
}