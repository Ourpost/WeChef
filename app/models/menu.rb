class Menu < ApplicationRecord
  has_one_attached :photo


  # validate
  validates :name, presence: true
  validates :price, presence: true ,numericality: { only_integer: true }


  # relationships
  belongs_to :store


  def image_resize(size)
    return self.photo.variant(resize: size)
  end

end
