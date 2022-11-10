# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faraday'

def generate_movie(query)
  conn = Faraday.new(
    url: "https://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&#{query}",
    params: {param: '1'},
    headers: {'Content-Type' => 'application/json'}
  )

  response = conn.get
  json = JSON.parse(response.body)

  Movie.create(title: json['Title'], genre: get_single_string(json["Genre"]) , release_date: json["Year"], poster_image_url: json["Poster"], rating: json["Rated"], language: get_single_string(json["Language"]), runtime: json['Runtime'])
end

def get_single_string(string)
  array = string.split(",")
  array.first
end

the_nice_guys = generate_movie("t=The+Nice+Guys&y=2016")
the_departed = generate_movie("t=The+Departed&y=2006")

user_1 = User.create(first_name: "test", last_name: "user", username: "tester", email: "test@test.com", password: "testtest")

review_1 = Review.create(score: 10, title: "AMAZING" , body: "This movie is one of the greatest movies I have ever seen in my entire life", user: user_1 , movie: Movie.first )
review_2 = Review.create(score: 8, title: "Not bad", user: user_1 , movie: Movie.first )