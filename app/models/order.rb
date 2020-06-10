class Order < ApplicationRecord
    belongs_to :buyer
    belongs_to :product
    # has_many :products
    # has_many :order_products
    validates :count, presence: true
    validates :delivery, presence: true
    validates :remark, presence: true

    validates_acceptance_of :confirming, allow_nil: false, on: [:create]
    after_validation :check_confirming
    def check_confirming
        errors.delete(:confirming)
        self.confirming = errors.empty? ? '1' : ''
    end
end

