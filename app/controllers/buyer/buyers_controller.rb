class Buyer::BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
    if @buyer != current_buyer
      chats = current_producer.chats
      @buyer_ids = []
      chats.each do |chat|
        @buyer_ids << chat.buyer_id
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
    @buyer.update(buyer_params)
    redirect_to buyer_path(@buyer)
  end
  
  # 退会ページへ遷移
  def quit
    @buyer = Buyer.find(params[:id])
  end

  def index
    @search = Buyer.ransack(params[:q])
    @results = @search.result
    @buyers = Buyer.all
  end

  private
  def buyer_params
    params.require(:buyer).permit(:email, :name, :kana_name, :company_name, :kana_company_name, :phone_number, :postcode, :address, :hp, :description, :profile_image, :prefecture)
  end
end
