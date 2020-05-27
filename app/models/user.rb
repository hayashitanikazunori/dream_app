class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :favorites
  has_many :fav_posts, through: :favorites, source: :post
  
  # postモデル関連付け
  def posts
    return Post.where(user_id: self.id)
  end

  # 応援機能のメソッド
  def like(post)
    favorites.find_or_create_by(post_id: :post.id)
  end

  def unlike(post)
    favorite = favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
end