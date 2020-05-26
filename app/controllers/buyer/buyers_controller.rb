class Buyer::BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
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
    @buyers = Buyer.all
  end

  private
  def buyer_params
    params.require(:buyer).permit(:email, :name, :kana_name, :company_name, :kana_company_name, :phone_number, :postcode, :address, :hp, :description)
  end
end
