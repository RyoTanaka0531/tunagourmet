class Order < ApplicationRecord
    belongs_to :buyer
    belongs_to :product
    # has_many :products
    # has_many :order_products
    validates :count, presence: true
    validates :delivery, presence: true
    validates :remark, presence: true

    enum order_status: {
        受注待ち:0, 受注完了:1, 発送済み:2, 納品完了:3
    }

    validates_acceptance_of :confirming, allow_nil: false, on: [:create]
    after_validation :check_confirming
    def check_confirming
        errors.delete(:confirming)
        self.confirming = errors.empty? ? '1' : ''
    end
end
