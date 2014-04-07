require 'spec_helper'

feature 'user sign out', %Q{
  As an authenticated user
  I want to sign out
  So that I can exit the system
} do

  # ACCEPTANCE CRITERIA
  # I must be able to log out after previously signing in

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user can log out' do
    sign_in_as(user)
    click_on 'Log Out'

    expect(page).to have_content('Signed out successfully.')
    expect(current_path).to eq(root_path)
  end
end
