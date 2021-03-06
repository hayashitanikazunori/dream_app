class Post < ApplicationRecord
  belongs_to :user
  has_many :favolites, dependent: :destroy
  # 投稿が誰にいいねされているかが簡単に取得できる
  has_many :favolited_users, through: :favolites, source: :user
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 20 }
  validates :comment, presence: true, length: { maximum: 50 }
  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  # userモデル関連付け
  def user
    return User.find_by(id: self.user_id)
  end
end