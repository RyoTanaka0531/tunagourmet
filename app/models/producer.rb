class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :chats, dependent: :destroy
  belongs_to :prefecture, optional: true
  attachment :profile_image
  validates :company_name, presence: :ture
  validates :kana_company_name, presence: :ture

  def liked_by?(producer)
    likes.where(producer_id: producer.id).exists?
  end

end
