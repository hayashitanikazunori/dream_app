class Post < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  validates :comment, presence: true
  has_one_attached :image
end
