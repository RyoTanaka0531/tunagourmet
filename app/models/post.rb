class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :producer, optional: true
    belongs_to :buyer, optional: true
    attachment :image
end
