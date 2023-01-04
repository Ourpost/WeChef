# frozen_string_literal: true

class Order < ApplicationRecord
  acts_as_paranoid
  has_one_attached :avatar

  validates :serial, presence: true, uniqueness: true
  before_validation :generate_serial

  include AASM

  aasm do
    state :pending, initial: true
    state :paid, :refunded, :served

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :serve do
      transitions from: :paid, to: :served
    end

    event :refund do
      transitions from: %i[paid served], to: :refunded
    end
  end

  private

  def generate_serial
    self.serial = SecureRandom.alphanumeric(15)
  end
end
