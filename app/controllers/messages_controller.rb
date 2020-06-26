class MessagesController < ApplicationController
    before_action :require_signed_in

    def create
        @chat = Chat.find(params[:chat_id])
        @message = Message.new(message_params)
        #メッセージがproduerに夜ものだったらis_producer=true,buyerによるものだったらis_producer=false
        if producer_signed_in?
            @message.is_producer = true
        elsif buyer_signed_in?
            @message.is_producer = false
        end

        @message.chat_id = @chat.id
        if @message.save
            redirect_to chat_url(@chat)
        else
            redirect_to chat_url(@chat)
        end
    end

    private
    def message_params
        params.require(:message).permit(:content)
    end

    def require_signed_in
        unless signed_in?
            flash[:error] = "新規登録またはログインをしてください"
            redirect_to sign_up_path
        end
    end
end