class Order < ApplicationRecord
    belongs_to :buyer
    has_many :order_products
    # belongs_to :product
end
