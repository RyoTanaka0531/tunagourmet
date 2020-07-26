class Buyer::OrdersController < ApplicationController
  before_action :authenticate_buyer!

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to completed_order_path
    else
      # confirmingがnilだったらこっちに進む
      @product = Product.find(@order.product_id)
      @producer = Producer.find(@product.producer_id)
      # 入力フォームに値が入力されなかったときの分岐
      if @order.count.present? && @order.payment.present?
        render 'confirm'
      else
        flash[:alert] = "入力に空欄、または不備があります。正しく入力してください。"
        redirect_to request.referer
      end
    end
  end

  def confirm
    @product = Product.find(@order.product_id)
    @order = Order.new
  end

  def index
    @buyer = current_buyer
    @orders = Order.where(buyer_id: [current_buyer.id]).order(id: "DESC").page(params[:page]).per(10)
    if @orders.present?
      @product = Order.find_by(buyer_id: @buyer.id).product
    else
      flash[:alert] = '発注履歴はありません。'
      redirect_to products_path
    end
  end

  def show
    @order = Order.find(params[:id])
    # ↓この形でproductとorderが紐づき、orderに紐づいたproductを取り出せる
    @product = Product.find(@order.product_id)
  end

  def completed
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:remark, :buyer_id, :product_id, :delivery, :count, :payment,
                                  :confirming, :producer_id, :order_status)
  end
end
