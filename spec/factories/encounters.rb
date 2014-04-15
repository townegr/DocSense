FactoryGirl.define do
  factory :encounter do
    patient_name 'John Daley'
    insurance_provider 'Medicare'
    notes 'Comments for patient-procedure'

    procedure
    user
  end
end
