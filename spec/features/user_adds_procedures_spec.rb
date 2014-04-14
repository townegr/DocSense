require 'spec_helper'

feature 'physician adds procedures to a list',  %Q{
  As an authenticated physician/user
  I want to create a new instance of a procedure
  So that I can track my daily productivity
} do

  # ACCEPTANCE CRITERIA
  # I can add a new procedure
  # I can add an existing/recent procedure from drop-down list
  # I can see all my procedures in my daily schedule

  let(:user) { FactoryGirl.create(:user) }

  scenario 'physician inputs a valid procedure' do
    procedure = FactoryGirl.build(:procedure)
    prev_count = Procedure.count
    sign_in_as(user)
    visit new_procedure_url

    fill_in 'Patient Name', with: procedure.patient_name
    fill_in 'Insurance Provider', with: procedure.insurance_provider
    fill_in 'Procedure Type', with: procedure.description
    fill_in 'Code', with: procedure.code
    fill_in 'Work RVU', with: procedure.work_rvu
    click_on 'Add Procedure'

    expect(page).to have_content('Procedure added to schedule')
    expect(Procedure.count).to eq(prev_count + 1)
  end

  scenario 'physician can review a specific procedure and notes' do
    procedure = FactoryGirl.create(:procedure)
    sign_in_as(user)
    visit new_procedure_path
    click_on 'Add Procedure'

    expect(current_url).to eq(procedures_url)
  end
end
