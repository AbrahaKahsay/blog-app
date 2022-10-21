class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_counter
    user.posts_counter = 0 if user.posts_counter.nil?
    user.increment!(:posts_counter)
  end

  def recent_five_comments
    comments.order!(created_at: :desc).limit(5)
  end

  # validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
