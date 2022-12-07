class CreateItemRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :item_ratings do |t|
      
      t.references   :rating,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
