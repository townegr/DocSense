require 'spec_helper'

feature 'user creates a new schedule', %Q{
  As an authenticated user
  I want to add a new hospital schedule ordered and labeled by date
  So that I can view most recent daily schedules
  } do

  # ACCEPTANCE CRITERIA
  # I can add an empty schedule
  # I must select the month/day/year of new schedule
  # I can optionally add a title for the new schedule
  # I can see all schedules ordered by descending date

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user submits valid information to create empty schedule' do
    prev_count = Schedule.count
    sign_in_as(user)
    visit root_url
    #include button to 'Add Schedule'

    #default to or select "Today's Date"
    select 'April', from: 'Month'
    select '15', from: 'Day'
    select '2014', from: 'Year'
    fill_in schedule.title, with: 'Patient Schedule 1' #make title == date unless otherwise specified
    click_on 'Create Schedule'

    expect(page).to have_content('Successfully created schedule')
    expect(Schedule.count).to eq(prev_count + 1)
    expect(current_url).to eq(schedule_url)
  end
  scenario 'user submits invalid information'
  scenario 'user can view most recent schedules'
end

#create an empty hospital schedule
#hospital
