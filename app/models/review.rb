class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "Your rating is not a valid number for rating" }
  validates :rating, numericality: { only_integer: true }
end
