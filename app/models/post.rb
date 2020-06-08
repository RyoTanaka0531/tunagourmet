class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :producer, optional: true
    belongs_to :buyer, optional: true
    attachment :image
    #最新の投稿が上に表示されるようにする
    default_scope -> { order(created_at: :desc) }
    validates :heading, presence: true, length: {maximum: 20}
    validates :content, presence: true
    def liked_by?(producer)
        likes.where(producer_id: producer.id).exists?
    end

    #liked_byはproducer側で使っているのでbuyer側は_buyerを付け足して定義
    def liked_by_buyer?(buyer)
        likes.where(buyer_id: buyer.id).exists?
    end
end
