class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  validates :comment, presence: true, length: { maximum: 100 }
  has_one_attached :image
end
