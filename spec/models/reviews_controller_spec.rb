require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:movie_1) {Movie.create(
      title: "Star Wars: A New Hope", 
      genre: "action", 
      release_date: "1977", 
      poster_image_url:"https://m.media-amazon.com/images/I/81P3lDJbjCL.jpg", 
      score: 10, 
      rating: "PG",  
      runtime: "205 Minutes")}
  
  let!(:user_1){ User.create(
    first_name: "test", 
    last_name: "user", 
    username: "tester", 
    email: "test@test.com", 
    password: "testtest"
  )}
    
  describe "POST#create" do
    scenario "user submits valid information" do
      sign_in user_1
      
      get :create, params: {
        review: {
          score: 8, 
          title: "Not bad more char", 
        },
        movie_id: movie_1.id
      }

      returned_json = JSON.parse(response.body)
      review = returned_json["review"]

      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"

      expect(review["id"]).to eq Review.last.id
      expect(review["score"]).to eq Review.last.score
      expect(review["title"]).to eq Review.last.title
      expect(review["body"]).to eq Review.last.body
      expect(review["movie"]["id"]).to eq movie_1.id
      expect(review["user"]["id"]).to eq user_1.id
      
    end

    scenario "user submits invalid information" do
      sign_in user_1

      get :create, params: {
        review: {
          title: "something"
        },
        movie_id: movie_1.id
      }

      expect(response.status).to eq 401 
    end
  end 
end