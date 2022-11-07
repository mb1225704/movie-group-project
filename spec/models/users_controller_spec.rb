require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:user_1){ User.create(
    first_name: "test", 
    last_name: "user", 
    username: "tester", 
    email: "test@test.com", 
    password: "testtest"
  )}
  
  describe "GET#index" do
    it "should return the id and name of current user" do
      sign_in user_1

      get :index

      returned_json = JSON.parse(response.body)
      user = returned_json["user"]

      expect(response.status).to eq 200
      expect(user["id"]).to eq user_1.id
      expect(user["username"]).to eq user_1.username
    end
  end 
end