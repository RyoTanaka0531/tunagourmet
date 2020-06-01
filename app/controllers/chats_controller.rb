class ChatsController < ApplicationController

  def index
    if producer_signed_in?
      @chats = current_producer.chats
      # @chat = Chat.find(params[:id])
      # @buyers = @chat.buyers
      # @buyer_ids = []
      # @chats.each do |chat|
      # @buyer_ids << chat.buyer_id
      # end
    elsif buyer_signed_in?
      @chats = current_buyer.chats
      # @producers = Producer.all
      # chats = current_buyer.chats
      # @producer_ids = []
      # chats.each do |chat|
        # @producer_ids << chat.producer_id
      # end
    end
  end

  def show
    @chat = Chat.find(params[:id]) #チャット情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @chat.messages #チャット内のメッセージを全て取得
    # @buyer = Buyer.find(params[:id])
    # @prducer = Producer.find(params[:id])
    if producer_signed_in?
      if @chat.producer.id == current_producer.id
        @buyer = @chat.buyer
      else
        redirect_to root_path
      end
    elsif buyer_signed_in?
      if @chat.buyer.id == current_buyer.id
        @producer = @chat.producer
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    if producer_signed_in?
      #producerがログインしてたらproducer_idを、buyerがログインしてたらbuyer_idを@chatに入れる
      @chat = Chat.new(chat_buyer_params)
      @chat.producer_id = current_producer.id
    elsif buyer_signed_in?
      @chat = Chat.new(chat_producer_params)
      @chat.buyer_id = current_buyer.id
    else
      redirect_to root_path
    end

    if @chat.save
      redirect_to chat_path(@chat)
    else
      redirect_to root_path
    end
  end

  private
  def chat_buyer_params
    params.require(:chat).permit(:buyer_id)
  end

  def chat_producer_params
    params.require(:chat).permit(:producer_id)
  end
end

