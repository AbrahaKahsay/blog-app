class Post < ApplicationRecord
    belongs_to :user, index: { unique: true }, foreign_key: true
    has_many :comments
    has_many :likes
end