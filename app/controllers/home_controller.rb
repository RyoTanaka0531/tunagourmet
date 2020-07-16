class HomeController < ApplicationController
    def top
        @producers = Producer.where(is_deleted: ["false"]).order(id: "DESC")
        @buyers = Buyer.where(is_deleted: ["false"]).order(id: "DESC")
        @products = Product.order(id: "DESC")
    end

    def select
    end
end
