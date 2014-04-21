require 'spec_helper'

feature 'physician can view total productivity', %Q{
  As a physician
  I want to view my total physician fees and work RVUs (per list/date range)
  So that I can understand my workflow trends/patterns
} do

  # ACCEPTANCE CRITERIA
  # I must be able to see RVU and commission per patient
  # I must be able to see RVU and commission per encounter
  # I must be able to see total RVU and commission per daily schedule list
  # I must be able to see productivity chart displaying (range by day/month/year) RVU and commission

  let(:user) { FactoryGirl.create(:user) }

  scenario 'physician views total RVU/fee for multiple encounters/procedures' do
    FactoryGirl.create(:procedure)
    FactoryGirl.create_list(:encounter, 10)
    sign_in_as(user)
    visit encounters_path

    expect(Encounter.count).to eq(10)
    expect(page).to have_content('Patient Name')
    expect(page).to have_content('Physician Fee')
  end
end
