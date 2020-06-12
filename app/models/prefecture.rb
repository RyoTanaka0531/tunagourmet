class Prefecture < ApplicationRecord
    has_many :buyers
    has_many :producers
    validates :name, presence: true

end
