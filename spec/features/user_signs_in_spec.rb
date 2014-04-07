require 'spec_helper'

feature 'a user signs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can enter my system
  } do

  # ACCEPTANCE CRITERIA
  # Once signed up, I must be able to sign in

  let(:user) { FactoryGirl.create(:user) }

  scenario 'signing in' do
    sign_in_as(user)

    expect(page).to have_content("Welcome Dr. #{user.full_name}")
    expect(page).to have_content('Successfully signed in.')
  end
end
