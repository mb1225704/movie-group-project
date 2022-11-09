class Review < ApplicationRecord
  belongs_to :user 
  belongs_to :movie
  has_many :votes

  validates :score, :title, :movie, :user, presence: true
  validates :body, length: { minimum: 10 }, allow_nil: true
  validates :score, numericality: { greater_than_or_equal_to: 0}
  validates :score, numericality: { less_than_or_equal_to: 10}
end