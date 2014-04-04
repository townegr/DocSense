require 'spec_helper'

feature 'user registration', %Q{
  As a physician
  I want to securely register an account
  So that I can manage my work RVUs
  } do

  # ACCEPTANCE CRITERIA
  # I must provide first and last name
  # I must provide valid email address
  # I must select a role for account
  # I must provide a password with password confirmation

  scenario 'a user signs up' do
    visit root_path
    click_on 'Sign Up'

    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email Address', with: 'test@test.com'
    select 'Medical Provider', from: 'Job Title'
    fill_in 'user_password', with: 'qwertyqwerty'
    fill_in 'user_password_confirmation', with: 'qwertyqwerty'

    within('form') do
      click_on 'Sign Up'
    end

    expect(page).to have_content('You have successfully signed up.')
    expect(page).to have_content('Welcome Dr. John Smith!')
    expect(current_path).to eq(root_path)
  end
end
