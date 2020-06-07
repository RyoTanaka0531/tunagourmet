class Buyer::OrderProductsController < ApplicationController

    def create
        @order_product = OrderProduct.new(order_product_params)
        binding.pry
        if @order_product.save
        #リダイレクト先はorders#newかorders#confirm
        # redirect_to new_order_path
        redirect_to preconfirm_order_path(@order)
        else
            redirect_to root_path
        end
    end


    def new
        @order = Order.find(params[:id])
        @order_product = @order.order_products.build
        # @buyer = current_buyer
        @product = Product.find(params[:id])
    end

    def destroy
        @order_product = OrderProduct.find(params[:id])
        @order_product.destroy
        redirect_to root_path
    end

    def index
        @order_products = OrderProduct.all
    end

    private
    def order_product_params
        params.require(:order_product).permit(:count, :payment, :product_id, :order_id, :postage)
    end
end

