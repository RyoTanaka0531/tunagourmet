class Producer::OrdersController < ApplicationController
  before_action :authenticate_producer!
  def index
    @producer = current_producer
    @orders = Order.where(producer_id:@producer.id)
    @product = Order.find_by(producer_id:@producer.id).product
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
