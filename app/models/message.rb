class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true, length: { maximum: 100 }
end