# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movie_1 = Movie.create(title: "Star Wars: A New Hope", genre: "Action", release_date: "1977", poster_image_url:"https://m.media-amazon.com/images/I/81P3lDJbjCL.jpg", rating: "PG", language: "English", runtime: "205 Minutes")
movie_2 = Movie.create(title:"The Departed", genre:"Thriller", release_date:"2006", poster_image_url:"https://m.media-amazon.com/images/I/510gCMld+uL._AC_.jpg", rating:"R", runtime:"151 Minutes", description:"An undercover cop and a mole in the police rattempt to identify each other while infiltrating an Irish gang in South Boston.")
movie_3 = Movie.create(title:"Alien", genre:"Thriller", release_date:"1979", poster_image_url:"https://images.photowall.com/products/59754/alien.jpg?h=699&q=85", rating:"R", runtime:"117 Minutes", description:"The crew of a commercial spacecraft encounter a deadly lifeform after investigating an unknown transmission.")
movie_4 = Movie.create(title:"The Nice Guys", genre:"Mystery", release_date:"2016", poster_image_url:"https://m.media-amazon.com/images/I/51P81+7-6sL._AC_SY580_.jpg", rating:"R", runtime:"116 Minutes", description:"In 1970s Los Angeles, a mismatched pair of private eyes investigate a missing girl and the mysterious death of a film star.")

user_1 = User.create(first_name: "test", last_name: "user", username: "tester", email: "test@test.com", password: "testtest")

review_1 = Review.create(score: 10, title: "AMAZING" , body: "This movie is one of the greatest movies I have ever seen in my entire life", user: user_1 , movie: movie_1 )
review_2 = Review.create(score: 8, title: "Not bad", user: user_1 , movie: movie_1 )