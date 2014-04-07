require 'spec_helper'

feature 'user registration', %Q{
  As an unathenticated user
  I want to securely register an account
  So that I can track my work productivity
  } do

  # ACCEPTANCE CRITERIA
  # I must provide first and last name
  # I must provide valid email address
  # I must select a job title for account
  # I must provide a password with password confirmation

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user provides valid information when signing up' do

    visit root_path
    click_on 'Sign Up'

    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email Address', with: 'test@email.com'
    select 'Medical Provider', from: 'Job Title'
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation

    within('form') do
      click_on 'Sign Up'
    end

    expect(page).to have_content('You have successfully signed up.')
    expect(page).to have_content("Welcome Dr. #{user.full_name}!")
    expect(current_path).to eq(root_path)
  end

  scenario 'user provides invalid information when signing up' do
    visit root_path
    click_on 'Sign Up'

    within('form') do
      click_on 'Sign Up'
    end

    expect(page).to have_content("can't be blank")
  end
end
