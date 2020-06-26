class NotificationsController < ApplicationController
    before_action :require_signed_in

    def index
        if producer_signed_in?
            @notifications = current_producer.passive_notifications.order(id: "DESC").page(params[:page]).per(20)
        else
            @notifications = current_buyer.passive_notifications.order(id: "DESC").page(params[:page]).per(20)
        end
        @notifications.where(checked: false).each do |notification|
            notification.update_attributes(checked: true)
        end
    end
    private
    def require_signed_in
        unless signed_in?
        flash[:error] = "新規登録またはログインをしてください"
        redirect_to sign_up_path
        end
    end
end
