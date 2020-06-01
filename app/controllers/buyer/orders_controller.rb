class Buyer::OrdersController < ApplicationController
  def new
    # @order = Order.new
  end

  def create
    @order = Order.new(order_params)
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
    params.require(:order).permit(:count, :payment, :remark, :order_status, :buyer_id)
  end
end
