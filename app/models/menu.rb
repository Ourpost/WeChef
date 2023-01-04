# frozen_string_literal: true

class Menu < ApplicationRecord
  # active
  has_one_attached :photo
  has_one_attached :avatar

  # validate
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :note, presence: true, length: { maximum: 150 }

  # relationships
  belongs_to :store
  belongs_to :classification

  def image_resize(size)
    photo.variant(resize: size)
  end
end
