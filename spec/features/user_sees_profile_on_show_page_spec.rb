require 'rails_helper'
feature "User sees profile on show page" do

    let!(:user_1) { User.create(email: "patrickstar24@aol.com", first_name: "Patrick", last_name: "Star", profile_photo: "https://cdn.shopify.com/s/files/1/0054/4371/5170/products/PatrickStar_467pin.png?v=1627414164", password: "password", password_confirmation: "password") }

    scenario 'visit and view user_1 profile show page' do
        visit user_path(user_1)
        
        expect(page).to have_content(user_1.email)
        expect(page).to have_content(user_1.first_name)
        expect(page).to have_content(user_1.last_name)
    end
end