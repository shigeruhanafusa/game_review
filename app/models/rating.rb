class Rating < ApplicationRecord
  belongs_to :item

  def change
    add_column :ratings, :rate, :float, null: false, default: 0
  end

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

end
