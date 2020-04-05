class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :settle, presence: true, length: { maximum: 300 }
  
  has_many :favorites
  has_many :fav_users, through: :favorites, source: :user
  
end
