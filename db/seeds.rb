# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movie_1 = Movie.create(title: "Star Wars: A New Hope", genre: "action", release_date: "1977", poster_image_url:"https://m.media-amazon.com/images/I/81P3lDJbjCL.jpg", score: 10, rating: "PG", language: "English", runtime: "205 Minutes")
movie_2 = Movie.create(title:"The Departed", genre:"Thriller", release_date:"2006", poster_image_url:"https://m.media-amazon.com/images/I/510gCMld+uL._AC_.jpg", score:10, rating:"R", runtime:"151 Minutes", description:"An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.")

user_1 = User.create(first_name: "test", last_name: "user", username: "tester", email: "test@test.com", password: "testtest")

review_1 = Review.create(score: 10, title: "AMAZING" , body: "This movie is one of the greatest movies I have ever seen in my entire life", user: user_1 , movie: movie_1)
review_2 = Review.create(score: 8, title: "Not bad", user: user_1 , movie: movie_1 )

vote_1 = Vote.create(review: review_1, user: user_1, vote_value: 1)

