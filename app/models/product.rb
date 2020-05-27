class Product < ApplicationRecord
    belongs_to :producer
    belongs_to :category
    attachment :product_image
end
