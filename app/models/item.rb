class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_many :likes
  has_many :ratings
  has_many :liked_users, through: :likes, source: :user

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
end
