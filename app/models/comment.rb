class Comment < ApplicationRecord
    belongs_to :producer, optional: true
    belongs_to :buyer, optional: true
    belongs_to :post
    validates :content, presence: true, length: {maximum: 100}
end
