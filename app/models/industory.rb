class Industory < ApplicationRecord
    has_many :buyers
    validates :name, presence: true

end
