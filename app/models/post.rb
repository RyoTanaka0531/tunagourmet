class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :producer
    belongs_to :buyer
end
