require 'rails_helper'

feature "user visits sign in page" do

  let!(:user_1) {User.create(first_name: "Dave", last_name: "Davidson", username:"ddson", profile_image_url: "https://thumbs.dreamstime.com/b/default-profile-picture-avatar-photo-placeholder-vector-illustration-default-profile-picture-avatar-photo-placeholder-vector-189495158.jpg",email:"dd@gmail.com", encrypted_password:"123456")}

  scenario "new user can add information" do
    visit new_user_registration_path

    fill_in 'Email', with: user_1.email
    fill_in 'First name', with: user_1.first_name 
    fill_in 'Last name', with: user_1.last_name 
    fill_in 'Username', with: user_1.username 
    fill_in 'Password', with: user_1.encrypted_password 
    fill_in 'Password confirmation', with: user_1.encrypted_password 

    click_button 'Sign up'
    click_on 'Profile'

    click_on "Edit Profile Information"
    
    expect(page).to have_field('First name', with: user_1.first_name)
    expect(page).to have_field('Last name', with: user_1.last_name)
    expect(page).to have_field('Email', with: user_1.email)
  end

  scenario "user edits and updates information" do

    visit new_user_registration_path

      fill_in 'Email', with: user_1.email
      fill_in 'First name', with: user_1.first_name 
      fill_in 'Last name', with: user_1.last_name 
      fill_in 'Username', with: user_1.username 
      fill_in 'Password', with: user_1.encrypted_password 
      fill_in 'Password confirmation', with: user_1.encrypted_password 

      click_button 'Sign up'
      click_on 'Profile'
      click_on "Edit Profile Information"

      fill_in 'First name', with: "Jeff"
      fill_in 'Current password', with: user_1.encrypted_password
 
      click_on 'Update'

      expect(page).to have_content("Your account has been updated successfully.")
  end       
end
