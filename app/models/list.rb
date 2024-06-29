class List < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  belongs_to :supermarket
  has_many :products
  has_many :list_guests
  has_many :reviews
  validates :name, :access_type, :budget, presence: true

  ACCESS_TYPES = ["Public", "Private"]


  def average_rating
    reviews.any? ? reviews.average(:rating).to_f : 0
  end

end
