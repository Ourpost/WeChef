class Classification < ApplicationRecord
  belongs_to :store
  has_many :menus
end
