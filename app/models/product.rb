class Product < ApplicationRecord
    belongs_to :producer
    belongs_to :category
    has_many :orders
    attachment :product_image
end
