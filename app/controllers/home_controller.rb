class HomeController < ApplicationController
    def top
        # @producers = Producer.where(is_deleted: ["false"])
        @producers = Producer.all
        # @buyers = Buyer.where(is_deleted: ["false"])
        @buyers = Buyer.all
        @products = Product.all
    end

    def select
    end
end
