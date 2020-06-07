class Buyer::OrdersController < ApplicationController

  def new
    # @order_product = OrderProduct.find_by(params[:buyer_id])
    # @order = @order_product.order
    # @order = Order.find_by(params[:order_product_id])
    # # @order_product = OrderProduct.find(params[:id])
    # @order_product = OrderProduct.find(params[:buyer_id])
    # @order = Order.new
    @buyer = current_buyer
    @order = @buyer.orders.build
    @product = Product.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.save
    # binding.pry
    redirect_to new_order_product_path
  end

  def confirm
  end
  def preconfirm
  end

  def completed
  end

  def index
    @order_products = @order.order_products
  end

  def show
  end

  def edit
  end
  def update
    order
  end

  private
  def order_params
    params.require(:order).permit(:remark, :order_status, :buyer_id, :product_id, :delivery)
  end
end
