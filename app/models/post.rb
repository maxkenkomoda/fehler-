class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :settle, presence: true, length: { maximum: 300 }
  
end
