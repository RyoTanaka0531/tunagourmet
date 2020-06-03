class Product < ApplicationRecord
    belongs_to :producer
    belongs_to :category
    has_many :orders
    attachment :product_image
    validates :name, presence: true
    validates :price, presence: true
    validates :timing, presence: true
    validates :description, presence: true
end
