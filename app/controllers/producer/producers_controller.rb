class Producer::ProducersController < ApplicationController
  before_action :authenticate_producer!, only:[:edit, :update]
  before_action :correct_producer, only:[:edit, :update]

  def show
    @producer = Producer.find(params[:id])
    @products = @producer.products
    if @producer != current_producer
      if buyer_signed_in?
        chats = current_buyer.chats
        @producer_ids = []
        chats.each do |chat|
          @producer_ids << chat.producer_id
        end
      elsif producer_signed_in?
        chats = current_producer.chats
        @producer_ids = []
        chats.each do |chat|
          @producer_ids << chat.producer_id
        end
      end
    end
  end

  def create
    @producer = Producer.new(producer_params)
    @producer.save
    redirect_to root_path
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      flash[:notice] = "登録内容が変更されました。"
      redirect_to producer_path(@producer.id)
    else
      flash[:notice] = "入力に不備があります。正しく入力をしてください。"
      redirect_to request.referer
    end
  end

  # 退会ページへ遷移
  def quit
    @producer = Producer.find(params[:id])
    @producer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用お待ちしております。"
    redirect_to root_path
  end

  def index
    #検索formにパラメーターが入力された場合とされてない場合
    if params[:q].present?
      @search = Producer.ransack(params[:q])
      @producers = @search.result.where(is_deleted: ["false"]).page(params[:page]).per(5)
    else
      @search = Producer.ransack()
      @producers = Producer.where(is_deleted: ["false"]).order(id: "DESC").page(params[:page]).per(5)
      @slick_producers = Producer.where(is_deleted: ["false"]).order(id: "DESC").limit(5)
    end
  end

  private
  def producer_params
    params.require(:producer).permit(:name, :kana_name, :company_name, :kana_company_name, :phone_number, :postcode, :address, :hp, :description, :profile_image, :prefecture_id,  :is_deleted)
  end
  def correct_producer
    @producer = Producer.find(params[:id])
    unless @producer == current_producer
      redirect_to root_path
    end
  end
end

