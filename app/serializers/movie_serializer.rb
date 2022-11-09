class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :release_date, :poster_image_url, :language, :rating, :runtime, :description, :avg_score
  has_many :reviews
end