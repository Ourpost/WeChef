# frozen_string_literal: true

class Desk < ApplicationRecord
  validates :name, presence: true
  validates :seat_amount, presence: true

  belongs_to :store
  has_many :orders, dependent: :destroy

  after_create do
    update(serial_number: rand(10_000_000..99_999_999).to_s.insert(3, id.to_s))
  end
end
