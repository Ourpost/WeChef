class Menu < ApplicationRecord
  # validate
  validates :name, presence: true
  validates :price, presence: true ,numericality: { only_integer: true }


  # relationships
  belongs_to :store
  belongs_to :classification, :optional => true
end
