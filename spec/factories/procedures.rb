FactoryGirl.define do
  factory :procedure do
    patient_name 'Jay Cutler'
    insurance_provider 'Medicare'
    code '15736'
    description 'Muscle-skin graft arm'
    work_rvu '17.04'
  end
end
