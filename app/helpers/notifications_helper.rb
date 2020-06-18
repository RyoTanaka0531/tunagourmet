module NotificationsHelper
    def notification_form(notification)
        @visiter = notification.visiter
        @commnet = nil
        your_post = link_to 'あなたの投稿', post_path(notification), style:"font-weight: bold;"
        @visiter_comment = notification.comment_id
        case notification.action
        when "like" then
            # if @visiter == @buyer
                tag.a(notification.visiter.company_name, href: @visiter, style: "font-weight: bold;")+ 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;")+ "にいいねしました"
            # elsif @visiter == @producer
                # tag.a(notification.visiter.company_name, href: producer_path(@visiter))+ 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id))+ "にいいねしました"
            # end
        when "comment" then
            @comment = Comment.find_by(id: @visiter_comment)&.content
            # if @visiter == @buyer
                tag.a(@visiter.company_name, href: @visiter, style: "font-weight; bold;")+"が"+tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;")+"にコメントしました"
            # elsif @visiter == @producer
                # tag.a(@visiter.company_name, href: producer_path(@visiter))+"が"+tag.a('あなたの投稿', href: post_path(notification.post_id))+"にコメントしました"
            # end
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
