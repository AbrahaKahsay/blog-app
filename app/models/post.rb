class Post < ApplicationRecord
    belongs_to :user, index: { unique: true }, foreign_key: true
    has_many :comments
    has_many :likes

    def update_posts_counter
        user.increment!(:posts_counter)
    end

    def recent_five_comments
        comments.order!(created_at: :desc).limit(5)
    end
end