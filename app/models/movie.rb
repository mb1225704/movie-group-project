class Movie < ApplicationRecord
  validates :title, :genre, :release_date, :poster_image_url, :rating, :runtime, presence: true
  has_many :reviews

  def avg_score
    movie = Movie.find(id)
    reviews = movie.reviews

    total_score = reviews.reduce(0) do |sum,review|
      sum + review.score.to_i
    end

    average = (total_score/reviews.length.to_f).round(1)

    if (average.nan?)
      return "-"
    else 
      return average 
    end
  end
end