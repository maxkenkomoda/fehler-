class User < ApplicationRecord
  before_save { self.email.downcase! }
  #バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :birthday, presence: true
  validates :gender, presence: true
  has_secure_password
  
  has_many :posts
  has_many :favorites
  has_many :likes, through: :favorites, source: :post
  
  def like(other_post)      #お気に入り
    unless self == other_post
      self.favorites.find_or_create_by(post_id: other_post.id)
    end
  end
  
  def unlike(other_post)          #お気に入り解除
    like = self.favorites.find_by(post_id: other_post.id)
    like.destroy if like
  end
  
  def like?(other_post)     #すでにお気に入りしているかの確認
    self.likes.include?(other_post)
  end
end
