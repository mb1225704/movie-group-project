class Movie < ApplicationRecord
  validates :title, :genre, :release_date, :poster_image_url, :score, :rating, presence: true
end