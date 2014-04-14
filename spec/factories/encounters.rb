FactoryGirl.define do
  factory :encounter do
    notes 'Comments for patient-procedure'

    procedure
    user
  end
end
