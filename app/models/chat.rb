class Chat < ApplicationRecord
  belongs_to :producer, optional: true
  belongs_to :buyer, optional: true
  has_many :messages, dependent: :destroy
end
