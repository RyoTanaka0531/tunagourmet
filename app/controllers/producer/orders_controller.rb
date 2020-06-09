class Producer::OrdersController < ApplicationController
  before_action :authenticate_producer!
  def index
    @producer = current_producer
    @product = Product.find_by(producer_id:@producer.id)
    # @products = @producer.products
    # @products = @producer.products
    # @products.each do |product|
      # @orders = Product.find(product_id:product.id).orders
      @orders = Product.find_by(producer_id:@producer.id).orders
    # end
    # @orders = @products.orders
    # if params[:buyer_id]
    #   orders = Order.where(buyer_id: params[:buyer_id])
    #   @index_orders = orders.order(created_at: "DESC").page(params[:page])
    # else
    #   @index_orders = Order.order(created_at: "DESC").page(params[:page])
    # end
  end

  def show
  end

  def update
  end

  def confirm
  end

  def completed
  end
end