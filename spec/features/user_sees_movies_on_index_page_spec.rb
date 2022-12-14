require 'rails_helper'

feature "User sees movies on index page" do

  let!(:movie_1) {Movie.create(title: "Star Wars: A New Hope", genre: "Action", release_date: "1977", poster_image_url:"https://m.media-amazon.com/images/I/81P3lDJbjCL.jpg", rating: "PG", language: "English", runtime: "205 Minutes")}
  let!(:movie_2) { Movie.create(title:"The Departed", genre:"Thriller", release_date:"2006", poster_image_url:"https://m.media-amazon.com/images/I/510gCMld+uL._AC_.jpg", rating:"R", runtime:"151 Minutes", description:"An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.")}

  scenario 'user visits the root path' do
    
    visit root_path

    expect(page).to have_content("#{movie_1.title} (#{movie_1.release_date})")
    expect(page).to have_content(movie_1.genre)

    expect(page).to have_content(movie_2.avg_score)
    expect(page).to have_content(movie_2.rating)

  end

  scenario 'user visits the index page' do

    visit movies_path

    expect(page).to have_content("#{movie_1.title} (#{movie_1.release_date})")
    expect(page).to have_content(movie_1.genre)

    expect(page).to have_content(movie_2.avg_score)
    expect(page).to have_content(movie_2.rating)
  end

  scenario 'user clicks on movie card' do
    visit movies_path 

    click_on(movie_1.title)

    expect(page).to have_current_path("/movies/#{movie_1.id}")
  end
end