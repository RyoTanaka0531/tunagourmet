class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    # binding.pry
    if @order.save
    redirect_to order_path(@order)
    else
      # redirect_to request.referer
      render 'new'
    end
    # redirect_to order_confirm_path(@order)
    # redirect_to new_order_product_path(@order)
  end

  def confirm
    # @product = Product.find(params[:order_id])
    # @order = Order.find(params[:id])
    # @product = @order.product_id
    @order = Order.new(order_params)
    # @order = Order.find(params[:id])
  end

  def preconfirm
    # @order = Order.find(params[:id])
    # @order_product = OrderProduct.find(50)
    @product = Product.find(@order.product_id)
    # @order_prodcut = OrderProduct.find(@order.order_product_id)
    @order_prodcut = @order.order_product_id
  end

  def completed
  end
  
  def index
    @order_products = @order.order_products
  end
  
  def show
    @order = Order.find(params[:id])
    @product = Product.find(params[:id])
  end
  
  def edit
  end
  def update
    @order = @order_product.order
    if @order.update(order_params)
      redirect_to root_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:remark, :order_status, :buyer_id, :product_id, :delivery, :count, :confirming)
  end
end
