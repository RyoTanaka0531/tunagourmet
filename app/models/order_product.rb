class OrderProduct < ApplicationRecord
    belongs_to :product
    belongs_to :order

    # def price
    #     product.count * product.price
    # end
end
