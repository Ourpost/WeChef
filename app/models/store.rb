class Store < ApplicationRecord
  # relationships
  has_many :menus
  belongs_to :user


end
