require 'spec_helper'

feature 'a user signs in' do
  scenario 'signing in' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(page).to have_content("Welcome Dr. #{user.full_name}")
    expect(page).to have_content("Successfully signed in.")
  end
end
