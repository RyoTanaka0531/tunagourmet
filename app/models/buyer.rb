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
  attachment :profile_image
  belongs_to :industory, optional: true
  belongs_to :prefecture, optional: true

  #すでにいいねしているかどうか
  def liked_by_buyer?(buyer)
    likes.where(buyer_id: buyer.id).exists?
  end
end


