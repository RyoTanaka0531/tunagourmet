class Buyer::BuyersController < ApplicationController
  before_action :authenticate_buyer!, only: [:edit, :update]
  before_action :correct_buyer, only: [:edit, :update]

  def show
    @buyer = Buyer.find(params[:id])
    if @buyer != current_buyer
      if producer_signed_in?
        chats = current_producer.chats
        @buyer_ids = []
        chats.each do |chat|
          @buyer_ids << chat.buyer_id
        end
      elsif buyer_signed_in?
        chats = current_buyer.chats
        @buyer_ids = []
        chats.each do |chat|
          @buyer_ids << chat.buyer_id
        end
      end
    end
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.save
    redirect_to root_path
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def update
    @buyer = Buyer.find(params[:id])
    if @buyer.update(buyer_params)
      flash[:notice] = "登録情報を変更しました。"
      redirect_to buyer_path(@buyer)
    else
      flash[:notice] = "変更内容に不備があります。再度正しく入力してください。"
      redirect_to request.referer
    end
  end

  def quit
    @buyer = Buyer.find(params[:id])
    @buyer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用お待ちしております。"
    redirect_to root_path
  end

  def index
    if params[:q].present?
      @search = Buyer.ransack(params[:q])
      @buyers = @search.result.where(is_deleted: ["false"]).page(params[:page]).per(5)
      @slick_buyers = Buyer.where(is_deleted: ["false"]).order(id: "DESC").limit(5)
    else
      @search = Buyer.ransack()
      @buyers = Buyer.where(is_deleted: ["false"]).order(id: "DESC").page(params[:page]).per(5)
      @slick_buyers = Buyer.where(is_deleted: ["false"]).order(id: "DESC").limit(5)
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:email, :name, :kana_name, :company_name, :kana_company_name,
                                  :phone_number, :postcode, :address, :hp, :description,
                                  :profile_image, :prefecture_id, :industory_id, :is_deleted)
  end

  def correct_buyer
    @buyer = Buyer.find(params[:id])
    unless @buyer == current_buyer
      redirect_to root_path
    end
  end
end