class Review < ApplicationRecord
  belongs_to :user 
  belongs_to :movie

  validates :score, :title, :movie, :user, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 0}
  validates :score, numericality: { less_than_or_equal_to: 10}
end