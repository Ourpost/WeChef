class Menu < ApplicationRecord
  # has_one_attached :photo do |p| 
  #   p.variant :thumb, resize_to_limit: [50, 50]
  # end

  has_one_attached :photo 


  # validate
  validates :name, presence: true
  validates :price, presence: true ,numericality: { only_integer: true }
  validates :note, presence: true , length: { maximum: 150}

  # relationships
  belongs_to :store
  belongs_to :classification

  def image_resize(size)
    return self.photo.variant(resize: size)
  end
end
