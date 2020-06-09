class Buyer::OrdersController < ApplicationController

  def new
    @order = Order.new
    if @order.confirming.blank?
      @product = Product.find(@order.product_id)
    else
      @product = Product.find(params[:format])
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to completed_order_path
    else
      @product = Product.find(@order.product_id)
      @producer = Producer.find(@product.producer_id)
      render 'confirm'
    end
  end

  def confirm
    @product = Product.find(@order.product_id)
    @order = Order.new
  end


  def index
    @orders = Order.where(buyer_id:[current_buyer.id])
  end

  def show
    @order = Order.find(params[:id])
    #　↓この形でproductとorderが紐づき、orderに紐づいたproductを取り出せる
    @product = Product.find(@order.product_id)
  end

  def completed
  end

  private
  def order_params
    params.require(:order).permit(:remark, :buyer_id, :product_id, :delivery, :count, :payment, :confirming, :producer_id)
  end
end
