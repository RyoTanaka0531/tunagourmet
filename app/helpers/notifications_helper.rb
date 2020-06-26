module NotificationsHelper
    def notification_form(notification)
        @visiter = notification.visiter
        @visiter_producer = notification.visiter_producer
        @commnet = nil
        your_post = link_to 'あなたの投稿', post_path(notification), style:"font-weight: bold;"
        @visiter_comment = notification.comment_id
        case notification.action
        when "like" then
            if @visiter
                tag.a(notification.visiter.company_name, href: buyer_path(@visiter), style: "font-weight: bold;")+ 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;")+ "にいいねしました"
            elsif @visiter_producer
                tag.a(notification.visiter_producer.company_name, href: producer_path(@visiter_producer), style: "font-weight: bold;")+ 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;")+ "にいいねしました"
            end
        when "comment" then
            @comment = Comment.find_by(id: @visiter_comment)&.content
            @comment_producer = Comment.find_by(id: @visiter_producer_comment)&.content
            if @visiter
                tag.a(@visiter.company_name, href: buyer_path(@visiter), style: "font-weight: bold;")+"が"+tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;")+"にコメントしました"
            elsif @visiter_producercd
                tag.a(@visiter_producer.company_name, href: producer_path(@visiter_producer), style: "font-weight: bold;")+"が"+tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;")+"にコメントしました"
            end
        end
    end

    def unchecked_notifications
        if producer_signed_in?
            @notifications = current_producer.passive_notifications.where(checked: false)
        elsif buyer_signed_in?
            @notifications = current_buyer.passive_notifications.where(checked: false)
        end
    end
end
