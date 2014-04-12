require 'spec_helper'

feature 'physician creates a new encounters list', %Q{
  As an authenticated physician/user
  I want to create a daily encounters list
  So that I can build my day-to-day list of services rendered
  } do

  # ACCEPTANCE CRITERIA
  # I can add an empty schedule
  # I can see all schedules ordered by descending date

  let(:encounter) { FactoryGirl.create(:encounter) }

  scenario 'user submits valid information to create empty schedule' do
    prev_count = Encounter.count
    sign_in_as(encounter.user)
    visit new_encounter_url

    click_on 'Create List'

    expect(page).to have_content('Successfully created list')
    expect(Encounter.count).to eq(prev_count + 1)
    expect(current_url).to eq(encounter_url)
  end
  scenario 'user submits invalid information'
  scenario 'user can view most recent schedules'
end

#create an empty hospital schedule
#hospital
