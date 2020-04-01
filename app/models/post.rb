class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 75 }
  validates :content, presence: true, length: { maximum: 800 }
  validates :settle, presence: true, length: { maximum: 800 }
  
end
