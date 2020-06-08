class Buyer::BuyersController < ApplicationController
  before_action :authenticate_buyer!, only:[:edit]

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
      redirect_to buyer_path(@buyer)
    else
      redirect_to request.referer
    end
  end
  
  # 退会ページへ遷移
  def quit
    @buyer = Buyer.find(params[:id])
  end

  def index
    if params[:q].present?
      @search = Buyer.ransack(params[:q])
      @buyers = @search.result.page(params[:page]).per(5)
    else
      @search = Buyer.ransack()
      @buyers = Buyer.page(params[:page]).per(5)
    end
  end

  private
  def buyer_params
    params.require(:buyer).permit(:email, :name, :kana_name, :company_name, :kana_company_name, :phone_number, :postcode, :address, :hp, :description, :profile_image, :prefecture)
  end
end

