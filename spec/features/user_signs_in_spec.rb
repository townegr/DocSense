require 'spec_helper'

feature 'a user signs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can enter the system
  } do

  # ACCEPTANCE CRITERIA
  # Once signed up, I must be able to sign in

  scenario 'signing in' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(page).to have_content("Welcome Dr. #{user.full_name}")
    expect(page).to have_content("Successfully signed in.")
  end
end
