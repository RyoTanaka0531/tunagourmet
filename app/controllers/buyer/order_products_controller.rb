class Buyer::OrderProductsController < ApplicationController

    def create
        @order_product = OrderProduct.new(order_product_params)
        @order_product.save
        #リダイレクト先はorders#newかorders#confirm
        redirect_to root_path
    end


    def new
        @order_product = OrderProduct.new
        @product = Product.find(params[:id])
    end

    def destroy
        @order_product = OrderProduct.find(params[:id])
        @order_product.destroy
        redirect_to root_path
    end

    private
    def order_product_params
        params.require(:order_product).permit(:count, :payment, :product_id, :order_id, :postage)
    end
end

