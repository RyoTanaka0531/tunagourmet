class Comment < ApplicationRecord
    belongs_to :producer
    belongs_to :buyer
    belongs_to :post
end
