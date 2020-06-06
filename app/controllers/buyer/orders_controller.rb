class Buyer::OrdersController < ApplicationController

  def new
    @order_product = OrderProduct.new
    @order = Order.new
    @product = Product.find(params[:id])
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
