class Favolite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  # user_idとpost_idの組が1組しかできないようのバリデーション
  validates_uniqueness_of :post_id, scope: :user_id
end
