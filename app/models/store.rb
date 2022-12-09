class Store < ApplicationRecord
  # relationships
  has_many :menus
  has_many :classifications
  has_many :desks
  belongs_to :user
end
