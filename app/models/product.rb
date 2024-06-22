class Product < ApplicationRecord
  belongs_to :list
  validates :name, :quantity, presence: true
end
