class Order < ApplicationRecord
  acts_as_paranoid 

  validates :serial, presence: true, uniqueness: true
  before_validation :generate_serial

  include AASM

  aasm do
    state :pending, initial: true
    state :paid, :refunded

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end
  end
  
  private
  def generate_serial
    self.serial = SecureRandom.alphanumeric(15)
  end
end
