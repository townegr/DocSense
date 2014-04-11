FactoryGirl.define do
  factory :encounter do
    notes 'Comments for patient-procedure'

    procedure
    patient
    user
  end
end
