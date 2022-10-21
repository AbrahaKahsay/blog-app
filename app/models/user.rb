class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  def recent_three_posts
    User.order(created_at: :desc).limit(3)
  end

  # validations
  validates :name, presence: true
end