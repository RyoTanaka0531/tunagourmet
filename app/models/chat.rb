class Chat < ApplicationRecord
    belongs_to :producer
    belongs_to :buyer
    has_many :messages, dependent: :destroy
end
