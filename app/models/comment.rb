class Comment < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :producer, optional: true
  belongs_to :buyer, optional: true
  belongs_to :post
  validates :content, presence: true, length: { maximum: 100 }
end
