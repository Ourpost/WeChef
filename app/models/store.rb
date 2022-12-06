class Store < ApplicationRecord
  # relationships
  has_many :menus
  has_many :classifications
  belongs_to :user
end
