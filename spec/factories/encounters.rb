FactoryGirl.define do
  factory :encounter do
    patient_name 'John Daley'
    insurance_provider 'Medicare'
    notes 'Patient has high blood pressure'

    procedure
    user
  end
end
