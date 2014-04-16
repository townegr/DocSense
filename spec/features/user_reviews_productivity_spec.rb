require 'spec_helper'

feature 'physician can retrieve productivity data', %Q{
  As an authenticated physician/user
  I must be able to see my aggregate fee schedule
  So that I can compare trends over specified periods of time
} do

  # ACCEPTANCE CRITERIA
  # After submitting patient encounter, my fee/compensation is stored for that instance
  # I can extract data based on day, month, year
  # I can see totals of my selected fee/compensation specs
  # I can view my fee schedule in a bar chart for visual clarity

  scenario 'physician can retrieve patient/procedure encounters' do
    visit root_url
    click_on
  end
end
