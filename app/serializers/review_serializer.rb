class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :score, :title, :body, :user, :movie, :created_at
  belongs_to :user
end