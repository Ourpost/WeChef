# frozen_string_literal: true

class Store < ApplicationRecord
  has_one_attached :avatar

  # vailbel
  validates :name, presence: true
  validates :address, presence: true
  validates :tel, presence: true, numericality: { only_integer: true }

  # relationships
  has_many :menus, dependent: :destroy
  has_many :classifications, dependent: :destroy
  has_many :desks, dependent: :destroy
  belongs_to :user
end
