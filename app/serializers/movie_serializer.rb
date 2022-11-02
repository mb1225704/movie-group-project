class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :release_date, :poster_image_url, :score, :language, :rating, :runtime, :description
end
