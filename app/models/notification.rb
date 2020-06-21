class Notification < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    belongs_to :post, optional: true
    belongs_to :comment, optional: true
    belongs_to :visiter_producer, class_name: 'Producer', foreign_key: 'visiter_producer_id', optional: true
    belongs_to :visited_producer, class_name: 'Producer', foreign_key: 'visited_producer_id', optional: true
    belongs_to :visiter, class_name: 'Buyer', foreign_key: 'visiter_id', optional: true
    belongs_to :visited, class_name: 'Buyer', foreign_key: 'visited_id', optional: true
end
