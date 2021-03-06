class Producer::OrdersController < ApplicationController
  before_action :authenticate_producer!
  def index
    @producer = current_producer
    @orders = Order.where(producer_id: @producer.id).order(id: "DESC").page(params[:page]).per(10)
    if @orders.present?
      @product = Order.find_by(producer_id: @producer.id).product
    else
      flash[:alert] = '受注履歴はありません。'
      redirect_to products_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "受注情報を更新しました。"
      redirect_to producer_order_path(@order)
    end
  end

  def completed
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end