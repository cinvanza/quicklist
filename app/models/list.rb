class List < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  belongs_to :supermarket
  has_many :products
  has_many :list_guests
  has_many :reviews
  validates :name, :access_type, :budget, presence: true
  ACCESS_TYPES = ["Public", "Private"]
end
