class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
