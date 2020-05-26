class Chat < ApplicationRecord
    belongs_to :producer
    belongs_to :buyer
end
