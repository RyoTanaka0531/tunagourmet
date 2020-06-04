class Buyer::OrdersController < ApplicationController

  def new
    # params[:product_id]
    # params[:product_name]
    # params[:product_price]
    @order = Order.new
    @product = Product.find_by(id: params[:product_id])
    # @product = Product.find(params[product.id])
    # @order = Order.find_by(product_id: params[:product_id])
    # @product = Product.find(params[:id])
    # @product = Product.where(params[:product_id])
    # @producer = Producer.where(product_id:[:product_id])
  end

  def create
    @order = current_buyer.orders.build(product_id: params[:product_id])
    @order.save
    redirect_to root_path
  end

  def confirm
  end

  def completed
  end

  def index
  end

  def show
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:count, :payment, :remark, :order_status, :buyer_id, :product_id)
  end
end
