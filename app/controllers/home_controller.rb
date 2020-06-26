class HomeController < ApplicationController
    def top
        @producers = Producer.where(is_deleted: ["false"])
        @buyers = Buyer.where(is_deleted: ["false"])
        @products = Product.all
    end

    def select
    end
end
