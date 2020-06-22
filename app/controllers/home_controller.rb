class HomeController < ApplicationController
    def top
        @producers = Producer.all
        @buyers = Buyer.all
        @products = Product.all
    end

    def select
    end
end
