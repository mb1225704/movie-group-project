require 'rails_helper'

feature "user visits sign in page" do

  user_1 = User.new(email: 'john@example.com', first_name: 'John',last_name: 'Example', username: 'jexample', password: 'password' )

  scenario "user edits and updates information" do

    visit new_user_registration_path

      fill_in 'Email', with: user_1.email 
      fill_in 'First name', with: user_1.first_name 
      fill_in 'Last name', with: user_1.last_name 
      fill_in 'Username', with: user_1.username 
      fill_in 'Password', with: user_1.password
      fill_in 'Password confirmation', with: user_1.password
      attach_file 'user[profile_photo]', "#{Rails.root}/spec/support/images/David-Delahunty-Graphic-Design-Make-something-cool-everyday-11-594x821.jpeg"

      click_button 'Sign up'
      click_on 'Profile'
      click_on "Edit Information"

      fill_in 'First name', with: "Jeff"
      attach_file 'user[profile_photo]', "#{Rails.root}/spec/support/images/jqec58ch3dk21.webp"
      fill_in 'Current password', with: 'password'
 
      click_on 'Update'

      expect(page).to have_content "Your account has been updated successfully."
  end       
end
