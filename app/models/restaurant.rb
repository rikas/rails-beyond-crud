class Restaurant < ApplicationRecord
  has_many :reviews # restaurant.reviews
  validates :name, presence: true
end
