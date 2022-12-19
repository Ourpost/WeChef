class Order < ApplicationRecord
  validates :serial, presence: true, uniqueness: true

  before_validation :generate_serial

  private
  def generate_serial
    self.serial = SecureRandom.alphanumeric(15)
  end
end