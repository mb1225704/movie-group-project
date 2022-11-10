# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faraday"

def generate_movie(query)
  conn = Faraday.new(
    url: "https://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&#{query}",
    params: {param: "1"},
    headers: {"Content-Type" => "application/json"}
  )

  response = conn.get
  json = JSON.parse(response.body)

  Movie.create(title: json["Title"], genre: get_single_string(json["Genre"]) , release_date: json["Year"], poster_image_url: json["Poster"], rating: json["Rated"], language: get_single_string(json["Language"]), runtime: json["Runtime"], description: json["Plot"])

  puts "#{json["Title"]} created"
end

def get_single_string(string)
  if string && string.include?(",")
    array = string.split(",")
    return array.first
  else
    return string 
  end
end

user_1 = User.create(first_name: "test", last_name: "user", username: "DopeAdmin", email: "test@test.com", password: "testtest")


the_nice_guys = generate_movie("t=The+Nice+Guys&y=2016")
the_departed = generate_movie("t=The+Departed&y=2006")
hell_or_high_water = generate_movie("t=Hell+or+High+Water&y=2016")
whiplash = generate_movie("t=Whiplash&y=2014")
alien = generate_movie("t=alien&y=1979")
jurassic_park = generate_movie("t=jurassic+park&y=1993")
eighth_grade = generate_movie("t=eighth+grade&y=2018")
baywatch = generate_movie("t=baywatch&y=2017")
brazil = generate_movie("t=brazil&y=1985")
blade_runner = generate_movie("t=blade+runner&y=1982")
apocalypse_now = generate_movie("t=apocalypse+now&y=1979")
the_usual_suspect = generate_movie("t=the+usual+suspects")
the_other_guys = generate_movie("t=the+other+guys")
goodfellas = generate_movie("t=goodfellas")
mean_streets = generate_movie("t=mean+streets")
the_gentlemen = generate_movie("t=the+gentlemen")
the_northman = generate_movie("t=the+northman&y=2022")
skyfall = generate_movie("t=skyfall")
spirited_away = generate_movie("t=Spirited+Away")
jin_roh = generate_movie("t=Jin-Roh")
nausicaa = generate_movie("t=Nausica%C3%A4+of+the+Valley+of+the+Wind&y=1984")
everything_everywhere = generate_movie("t=Everything+Everywhere+All+at+Once&y=2022")
akira = generate_movie("t=Akira")
life_of_brian = generate_movie("t=Life+of+Brian")
no_country = generate_movie("t=No+Country+For+Old+Men&y=2007")
frozen = generate_movie("t=frozen&y=2013")
pulp_fiction = generate_movie("t=Pulp+Fiction")
dark_knight = generate_movie("t=The+Dark+Knight")
interstellar = generate_movie("t=Interstellar")
incredibles = generate_movie("t=Incredibles")
dr_strangelove = generate_movie("t=Dr+Strangelove+or%3A+How+I+Learned+to+Stop+Worrying+and+Love+the+Bomb&y=1964")
chinatown = generate_movie("t=Chinatown&y=1974")
ordet = generate_movie("t=Ordet&y=1955")
wild_strawberries = generate_movie("t=Wild+Strawberries&y=1957")
la_dolce_vita = generate_movie("t=La+dolce+vita&y=1960")
portrait_of_a_lady_on_fire = generate_movie("t=Portrait+of+a+Lady+on+Fire&y=2019")
train_to_busan = generate_movie("t=Train+to+Busan&y=2016")
the_scorpion_king = generate_movie("t=The+Scorpion+King&y=2002")
the_florida_project = generate_movie("t=The+Florida+Project&y=2017")
fantastic_mr_fox = generate_movie("t=Fantastic+Mr.+Fox&y=2009")
transformers_age_of_extinction = generate_movie("t=Transformers%3A+Age+of+Extinction&y=2014")
melancholia = generate_movie("t=Melancholia&y=2011")
sorry_to_bother_you = generate_movie("t=Sorry+to+Bother+You&y=2018")
fantasia = generate_movie("t=fantasia&y=1940")
the_prestige = generate_movie("t=the+prestige&y=2006")
all_the_presidents_men = generate_movie("t=All+the+President's+Men&y=1976")
casino = generate_movie("t=casino&y=1995")
reservoir_dogs = generate_movie("t=Reservoir+Dogs&y=1992")
wall_e = generate_movie("t=wall+e&y=2008")
the_cabinet_of_dr_caligari = generate_movie("t=The+Cabinet+of+Dr.+Caligari&y=1920")