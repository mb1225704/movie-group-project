class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :score, :title, :body, :movie, :user, :created_at
  belongs_to :user
end