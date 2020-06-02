class Like < ApplicationRecord
    belongs_to :producer, optional: true
    belongs_to :buyer, optional: true
    belongs_to :post
    # validates_uniqueness_of :post_id, scope: :producer_id
    # validates_uniqueness_of :post_id, scope: :buyer_id
end
