require 'spec_helper'

feature 'user creates a new list', %Q{
  As an authenticated user
  I want to add a new hospital list organized by date
  So that I can keep a daily schedule of services rendered
  } do

  # ACCEPTANCE CRITERIA
  # I must select the month/date/year of new list
  # I can optionally add a title for the new list
  # I can see all lists organized by descending date

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user submits valid information to create list' do
    sign_in_as(user)
    prev_count = HospitalList.count
    visit new_hospital_list_path
  end
  scenario 'user submits invalid information'
  scenario 'user can view most recent lists'
end
