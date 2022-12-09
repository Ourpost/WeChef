class Order < ApplicationRecord
    has_one_attached :photo

    has_many :menus

    def image_resize(size)
        return self.photo.variant(resize: size)
    end
end
