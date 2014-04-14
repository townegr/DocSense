# require 'spec_helper'

# feature 'physician creates a new encounters list', %Q{
#   As an authenticated physician/user
#   I want to create a daily encounters list
#   So that I can build my day-to-day list of services rendered
#   } do

#   # ACCEPTANCE CRITERIA
#   # I can add an empty schedule
#   # I can see all schedules ordered by descending date

#   scenario 'user creates a valid schedule' do
#     prev_count = Encounter.count
#     sign_in_as(user)
#     visit new_encounter_url
#     fill_in 'Patient Name', with: 'jon'
#     fill_in 'Procedure Description', with: 'stent'
#     click_on 'Add Schedule'

#     expect(page).to have_content('Successfully created schedule')
#     expect(Encounter.count).to eq(prev_count + 1)
#     expect(current_url).to eq(encounter_url)
#   end
#   scenario 'user submits invalid information'
#   scenario 'user can view most recent schedules'
# end

#create an empty hospital schedule
#hospital
