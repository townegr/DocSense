require 'spec_helper'

feature 'physician adds procedures to a list',  %Q{
  As an authenticated physician/user
  I want to create a new instance of a procedure
  So that I can populate my schedule with relevant procedure code and work RVU
} do

  # ACCEPTANCE CRITERIA
  # I can submit procedure in search field
  # I can see closest matches to query and select exact CMS.gov descriptions
  # I can add an existing/recent procedure from drop-down list
  # I can populate my relevant code and work RVU fields after selecting procedure description
  # I can persist submissions to the database
  # I can see all my procedures in my daily schedule

  let(:user) { FactoryGirl.create(:user) }

  scenario 'physician inputs a valid procedure for a patient encounter' do
    procedure = FactoryGirl.create(:procedure)
    encounter = FactoryGirl.build(:encounter, procedure: nil)
    prev_count = Encounter.count
    sign_in_as(user)
    visit new_encounter_path

    fill_in 'Patient Name', with: encounter.patient_name
    fill_in 'Insurance Provider', with: encounter.insurance_provider
    select procedure.description, from: 'Procedure Description'
    fill_in 'Notes', with: encounter.notes
    click_on 'Add Encounter'

    expect(page).to have_content('Encounter added to schedule')
    expect(Encounter.count).to eq(prev_count + 1)
  end

  scenario 'physician can review a specific encounter' do
    encounter = FactoryGirl.create(:encounter)
    procedure = FactoryGirl.create(:procedure)
    sign_in_as(user)
    visit encounters_url
    expect(page).to have_content(encounter.patient_name)

    click_button 'More Details'

    expect(page).to have_content(encounter.notes)
    expect(current_url).to eq(encounter_url(encounter))
  end
end
