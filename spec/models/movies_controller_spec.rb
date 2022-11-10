require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
    let!(:movie_1) {Movie.create(
        title: "Star Wars: A New Hope", 
        genre: "action", 
        release_date: "1977", 
        poster_image_url:"https://m.media-amazon.com/images/I/81P3lDJbjCL.jpg", 
        rating: "PG",  
        runtime: "205 Minutes")}
    let!(:movie_2) { Movie.create(
        title:"The Departed", 
        genre:"Thriller", 
        release_date:"2006", 
        poster_image_url:"https://m.media-amazon.com/images/I/510gCMld+uL._AC_.jpg", 
        rating:"R", 
        runtime:"151 Minutes",
        language: "English", 
        description:"An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston"
    )}
    
    let!(:user_1){ User.create(
      first_name: "test", 
      last_name: "user", 
      username: "tester", 
      email: "test@test.com", 
      password: "testtest"
    )}

    let!(:review_1){ Review.create(
      score: 10, 
      title: "AMAZING", 
      body: "This movie is one of the greatest movies I have ever seen in my entire life", 
      user: user_1 , 
      movie: movie_2 
    )}

    let!(:review_2){ Review.create(
      score: 8, 
      title: "Not bad", 
      user: user_1, 
      movie: movie_2 
    )}

    
    describe "GET#show" do
        it "should return the movie with the matching ID" do
            get :show, params: { id: movie_1.id }
            returned_json = JSON.parse(response.body)
            movie_info = returned_json["movie"]
            

            expect(response.status).to eq 200
            expect(response.content_type).to eq "application/json"

            expect(movie_info["id"]).to eq movie_1.id
            expect(movie_info["title"]).to eq movie_1.title
            expect(movie_info["genre"]).to eq movie_1.genre
            expect(movie_info["release_date"]).to eq movie_1.release_date
            expect(movie_info["poster_image_url"]).to eq movie_1.poster_image_url
            expect(movie_info["avg_score"]).to eq movie_1.avg_score
            expect(movie_info["rating"]).to eq movie_1.rating
            expect(movie_info["runtime"]).to eq movie_1.runtime
        end

        it "will return a language and description" do
            get :show, params: { id: movie_2.id }

            returned_json = JSON.parse(response.body)
            movie_info = returned_json["movie"]

            expect(response.status).to eq 200
            expect(response.content_type).to eq "application/json"

            expect(movie_info["language"]).to eq movie_2.language
            expect(movie_info["description"]).to eq movie_2.description
        end

        it "will return a list of reviews associated to that movie" do
          get :show, params: { id: movie_2.id }

          returned_json = JSON.parse(response.body)
          movie_info = returned_json["movie"]

          expect(response.status).to eq 200
          expect(response.content_type).to eq "application/json"

          expect(movie_info["reviews"].length).to eq 2
          expect(movie_info["reviews"][0]["id"]).to eq review_1.id
          expect(movie_info["reviews"][0]["score"]).to eq review_1.score
          expect(movie_info["reviews"][0]["title"]).to eq review_1.title
          expect(movie_info["reviews"][0]["body"]).to eq review_1.body
          expect(movie_info["reviews"][0]["user"]["id"]).to eq user_1.id
        end
    end 
end