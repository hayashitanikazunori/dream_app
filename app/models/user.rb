class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :favolites, dependent: :destroy
  # userがどの投稿に応援しているか簡単に取得できる
  has_many :favolited_posts, through: :favolites, source: :post
  
  # すでにいいねをしているかどうかを判定する
  def already_favolited?(post)
    self.favolites.exists?(post_id: post.id)
  end

  # postモデル関連付け
  def posts
    return Post.where(user_id: self.id)
  end
end