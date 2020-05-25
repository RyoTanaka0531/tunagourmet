class Buyer::BuyersController < ApplicationController
  def show
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def quit
  end

  def index
  end

  private
  def buyer_params
    params.require(:buyer).permit(:email)
  end
end
