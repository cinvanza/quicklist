class Review < ApplicationRecord
  belongs_to :user
  belongs_to :list
  validates :comment, presence: true
  validates :rating, presence: true, length: { minimum: 0, maximum: 5 }

end
