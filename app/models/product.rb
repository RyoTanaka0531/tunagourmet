class Product < ApplicationRecord
    belongs_to :producer
    belongs_to :category
    belongs_to :buyer, optional: true
    has_many :orders, dependent: :destroy

    attachment :product_image
    validates :name, presence: true, length: {maximum: 15}
    validates :price, presence: true
    validates :timing, presence: true
    validates :description, presence: true, length: {maximum: 120}
end
