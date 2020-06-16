class NotificationsController < ApplicationController
    def index
        if producer_signed_in?
            @notifications = current_producer.passive_notifications.page(params[:page]).per(20)
        elsif buyer_signed_in?
            @notifications = current_buyer.passive_notifications.page(params[:page]).per(20)
        end
            @notifications.where(checked: false).each do |notification|
                notification.update_attributes(checked: true)
            end
    end
end
