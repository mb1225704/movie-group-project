require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  let!(:user_1) { User.create(first_name: "test", last_name: "user", username: "tester", email: "test@test.com", password: "testtest")
  }
  
  scenario 'provide valid registration information' do
    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'First name', with: 'John' 
    fill_in 'Last name', with: 'Example'
    fill_in 'Username', with: 'jexample'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file 'user[profile_photo]', "#{Rails.root}/spec/support/images/David-Delahunty-Graphic-Design-Make-something-cool-everyday-11-594x821.jpeg"

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path
  
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'provides duplicated values where they cannot exist' do
    visit new_user_registration_path
    
    fill_in 'Email', with: 'test@test.com'
    fill_in 'First name', with: 'John' 
    fill_in 'Last name', with: 'Example'
    fill_in 'Username', with: 'jexample'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("Email has already been taken")
    expect(page).to_not have_content('Sign Out')
  end
end