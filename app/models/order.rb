class Order < ApplicationRecord
    belongs_to :buyer
    has_many :order_product
    # belongs_to :product
end
