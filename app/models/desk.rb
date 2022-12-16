class Desk < ApplicationRecord
  validates :name, presence: true
  validates :seat_amount, presence: true
  
  belongs_to :store
  has_many :orders
  
  after_create do
    self.update(serial_number: "#{rand(10000000..99999999)}".insert(3, "#{self.id}"))
  end
end
