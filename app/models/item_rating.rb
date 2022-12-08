class ItemRating < ApplicationRecord
  belongs_to :item
  belongs_to :rating
end
