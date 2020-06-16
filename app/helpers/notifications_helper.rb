module NotificationsHelper
    def notification_form(notification)
        @visiter = notification.visiter
        @commnet = nil
        your_post = link_to 'あなたの投稿', post_path(notification)
        @visiter_comment = notification.comment_id
        case notification.action
        when "like" then
            if @visiter == @producer
                tag.a(notification.visiter.name, href: producer_path(@visiter))+ 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id))+ "にいいねしました"
            elsif @visiter == @buyer
                tag.a(notification.visiter.name, href: buyer_path(@visiter))+ 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id))+ "にいいねしました"
            end
        when "comment" then
            @comment = Comment.fidn_by(id: @visiter_comment)&.content
            if @visiter == @producer
                tag.a(@visiter.neme, href: producer_path(@visiter))+"が"+tag.a('あなたの投稿', href: post_path(notification.post_id))+"にコメントしました"
            elsif @visiter == @buyer
                tag.a(@visiter.neme, href: buyer_path(@visiter))+"が"+tag.a('あなたの投稿', href: post_path(notification.post_id))+"にコメントしました"
            end
        end
    end
end
