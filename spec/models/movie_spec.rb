require 'rails_helper'

describe Movie do 

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

  describe "#avg_score" do

    context "The movie has reviews" do 
      it "returns the average of related reviews" do
        expect(movie_2.avg_score).to eq 9.0
      end
    end
    
    context "The movie has no reviews" do 
      it "returns the average of related reviews" do
        expect(movie_1.avg_score).to eq '-'
      end
    end
  end
end