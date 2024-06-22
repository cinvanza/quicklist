class List < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  belongs_to :supermarket
end
