class List < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  belongs_to :supermarket, optional: true
  has_many :products, dependent: :destroy
  has_many :list_guests, dependent: :destroy
  has_many :reviews, dependent: :destroy

  ACCESS_TYPES = ["Public", "Private"]


  def average_rating
    reviews.any? ? reviews.average(:rating).to_f : 0
  end

end
