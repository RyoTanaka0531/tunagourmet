class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :producer, optional: true
    belongs_to :buyer, optional: true
    attachment :image
    def liked_by?(producer)
        likes.where(producer_id: producer.id).exists?
    end
    def liked_by?(buyer)
        likes.where(buyer_id: buyer.id).exists?
    end
end
