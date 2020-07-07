class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :notifications, dependent: :destroy
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
    def create_notification_by_producer(current_producer)
        temp = Notification.where(["visiter_id = ? and visited_id || visited_producer_id = ? and post_id = ? and action = ? ", current_producer.id, buyer_id || producer_id, id, 'like'])
        if temp.blank?
            notification = current_producer.active_notifications.new(
                post_id: id,
                visited_id: buyer_id,
                visited_producer_id: producer_id,
                action: 'like'
            )
            if notification.visiter_id == notification.visited_id
                notification.checked = true
            elsif notification.visiter_producer_id == notification.visited_producer_id
                notification.checked = true
            end
            notification.save if notification.valid?
        end
    end
    def create_notification_by(current_buyer)
        temp = Notification.where(["visiter_id = ? and visited_id || visited_producer_id = ? and post_id = ? and action = ? ", current_buyer.id, buyer_id || producer_id, id, 'like'])
        if temp.blank?
            notification = current_buyer.active_notifications.new(
                post_id: id,
                visited_id: buyer_id,
                visited_producer_id: producer_id,
                action: 'like'
            )
            if notification.visiter_id == notification.visited_id
                notification.checked = true
            elsif notification.visiter_producer_id == notification.visited_producer_id
                notification.checked = true
            end
            notification.save if notification.valid?
        end
    end
    def create_notification_comment!(current_buyer, comment_id)
        # 自分以外にコメントしている人を全て取得し、全員に通知を送る
        temp_ids = Comment.select(:buyer_id).where(post_id: id).where.not(buyer_id: current_buyer.id).distinct
        temp_ids.each do |temp_id|
            save_notification_comment!(current_buyer, comment_id, temp_id['buyer_id', 'producer_id'])
        end
        # まだ誰もコメントしていない場合は、投稿者に通知を送る
        save_notification_comment!(current_buyer, comment_id, buyer_id, producer_id) if temp_ids.blank?
    end

    def save_notification_comment!(current_buyer, comment_id, buyer_id, producer_id)
        # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = current_buyer.active_notifications.new(
            post_id: id,
            comment_id: comment_id,
            visited_id: buyer_id,
            visited_producer_id: producer_id,
            action: 'comment'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visiter_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?
    end

    def create_notification_producer_comment!(current_producer, comment_id)
        # 自分以外にコメントしている人を全て取得し、全員に通知を送る
        temp_ids = Comment.select(:producer_id).where(post_id: id).where.not(producer_id: current_producer.id).distinct
        temp_ids.each do |temp_id|
            save_notification_producer_comment!(current_producer, comment_id, temp_id['buyer_id', 'producer_id'])
        end
        # まだ誰もコメントしていない場合は、投稿者に通知を送る
        save_notification_producer_comment!(current_producer, comment_id, buyer_id, producer_id) if temp_ids.blank?
    end

    def save_notification_producer_comment!(current_producer, comment_id, buyer_id, producer_id)
        # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = current_producer.active_notifications.new(
            post_id: id,
            comment_id: comment_id,
            visited_id: buyer_id,
            visited_producer_id: producer_id,
            action: 'comment'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visiter_producer_id == notification.visited_producer_id
            notification.checked = true
        end
        notification.save if notification.valid?
    end
end