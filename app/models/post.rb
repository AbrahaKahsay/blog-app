class Post < ApplicationRecord
    belongs_to :user
    has_many :Comments
    has_many :likes
end