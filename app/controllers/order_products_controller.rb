class OrderProductsController < ApplicationController

    def create
        @order_product = OrderProduct.new(order_product_params)
        @order_product.save
        #リダイレクト先はorders#newかorders#confirm
        # redirect_to
    end

    def destroy
        @order_product = OrderProduct.find(params[:id])
        @order_product.destroy
        redirect_to root_path
    end

    private
    def order_product_params
        require.params(:order_product).permit(:count, :postage, :product_id, :order_id)
    end
end
