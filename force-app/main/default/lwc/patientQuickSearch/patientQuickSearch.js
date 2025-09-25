import { LightningElement, track } from 'lwc';
import searchPatients from '@salesforce/apex/PatientController.searchPatients';
import { NavigationMixin } from 'lightning/navigation';
export default class PatientQuickSearch extends NavigationMixin(LightningElement) {
    @track searchKey = '';
    @track patients = [];
    @track errorMessage = '';
    columns = [
        { label: 'First Name', fieldName: 'First_Name__c' },
        { label: 'Last Name', fieldName: 'Last_Name__c' },
        { label: 'Status', fieldName: 'Status__c' }
    ];
    handleKeyChange(event) {
        this.searchKey = event.target.value;
    }
    // Imperative Apex call
    handleSearch() {
        this.patients = [];
        this.errorMessage = '';

        searchPatients({ searchKey: this.searchKey })
            .then(result => {
                this.patients = result;
                if (!result || result.length === 0) {
                    this.errorMessage = 'No patients found';
                }
            })
            .catch(error => {
                console.error(error);
                this.errorMessage = 'Error fetching patients';
            });
    }
    // Navigation to patient record
    handleRowAction(event) {
        const selectedPatient = event.detail.selectedRows[0];
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: selectedPatient.Id,
                objectApiName: 'Patients__c',
                actionName: 'view'
            }
        });
    }
}
