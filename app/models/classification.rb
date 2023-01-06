# frozen_string_literal: true

class Classification < ApplicationRecord
  validates :name, presence: true


  belongs_to :store
  has_many :menus
end
