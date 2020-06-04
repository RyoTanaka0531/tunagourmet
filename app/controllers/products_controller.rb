class ProductsController < ApplicationController
  def new
    @product = Product.new
    @products = current_producer.products
  end

  def create
    @product = Product.new(product_params)
    @product.producer_id = current_producer.id
      if @product.save
        redirect_to products_path
      else
        render 'new'
      end
  end

  def index
    if params[:q].present?
      @search = Product.ransack(params[:q])
      @products = @search.result
    else
      @search = Product.ransack()
      @products = Product.all
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
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
      redirect_to producer_path(@product.producer.id)
    else
      render 'show'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :timing, :category_id, :producer_id, :product_image)
  end
end

