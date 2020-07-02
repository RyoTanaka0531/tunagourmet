class ProductsController < ApplicationController
  before_action :require_signed_in, except:[:index, :show]
  before_action :correct_producer, only:[:edit, :update, :destroy]

  def new
    @product = Product.new
    @products = current_producer.products
  end

  def create
    @product = Product.new(product_params)
    @product.producer_id = current_producer.id
    if @product.save
      flash[:notice] = '登録が完了しました。'
      redirect_to product_path(@product)
    else
      flash[:notice] = '入力に不備があります。正しく入力してください。'
        redirect_to request.referrer
    end
  end

  def index
    if params[:q].present?
      @search = Product.ransack(params[:q])
      @products = @search.result.page(params[:page]).per(5)
      @slick_products = Product.order(id: "DESC").limit(5)
    else
      @search = Product.ransack()
      @products = Product.order(id: "DESC").page(params[:page]).per(12)
      @slick_products = Product.order(id: "DESC").limit(5)
    end
  end

  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "登録内容が変更されました。"
      redirect_to product_path(@product)
    else
      flash[:notice] = "入力に不備があります。正しく入力してください。"
      render 'edit'
    end
  end

  def show
    @order = Order.new
    @product = Product.find(params[:id])
    @producer = Producer.find(@product.producer_id)
    if @producer != current_producer
      if buyer_signed_in?
        chats = current_buyer.chats
        @producer_ids = []
        chats.each do |chat|
          @producer_ids << chat.producer_id
        end
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "削除しました。"
      redirect_to producer_path(@product.producer.id)
    else
      render 'show'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :timing, :category_id, :producer_id, :product_image)
  end
  def require_signed_in
    unless signed_in?
      flash[:error] = "新規登録またはログインをしてください"
      redirect_to sign_up_path
    end
  end

  def correct_producer
    @product = current_producer.products.find_by(id: params[:id])
    unless @product
      redirect_to root_path
    end
  end
end
