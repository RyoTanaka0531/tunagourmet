class OrderProduct < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :product, optional: true

    def price
        product.count * product.price
    end
end
