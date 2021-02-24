class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, :rating, presence: true

  validates :rating, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0, only_integer: true }
end
