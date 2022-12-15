class Store < ApplicationRecord
  

  # vailbel
  validates :name, presence: true
  validates :address, presence: true
  validates :tel, presence: true ,numericality: { only_integer: true }

  # relationships
  has_many :menus
  has_many :classifications
  has_many :desks
  belongs_to :user
end
