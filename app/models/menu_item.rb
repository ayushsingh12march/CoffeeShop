class MenuItem < ApplicationRecord
  belongs_to :menu
  has_one_attached :image

  def thumbnail
    return self.image.variant(resize: "150x100!")
  end
end
