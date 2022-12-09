class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items ,dependent: :destroy
  has_many :likes ,dependent: :destroy
  has_many :liked_items, through: :likes, source: :item

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end
end
