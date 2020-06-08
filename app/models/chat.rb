class Chat < ApplicationRecord
    belongs_to :producer
    belongs_to :buyer
    has_many :messages
    validates :content, presence: true, length: {maximum: 100}
end
