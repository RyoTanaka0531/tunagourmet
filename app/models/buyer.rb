class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  attachment :profile_image
  belongs_to :industory, optional: true
  belongs_to :prefecture, optional: true
  validates :company_name, presence: :ture
  validates :kana_company_name, presence: :ture

  #すでにいいねしているかどうか
  def liked_by_buyer?(buyer)
    likes.where(buyer_id: buyer.id).exists?
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end


