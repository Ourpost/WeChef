class Desk < ApplicationRecord
  belongs_to :store

  after_create do
    self.update(serial_number: self.serial_number.insert(3, "#{self.id}"))
  end
end
