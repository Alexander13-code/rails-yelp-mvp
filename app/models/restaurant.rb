class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORY = %w[chinese italian japanese french belgian].freeze

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORY, message: "your category is not a valid category of restaurant" }
end
