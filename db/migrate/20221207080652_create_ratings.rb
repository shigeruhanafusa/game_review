class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string       :evaluation, null: false
      t.float        :rate
      t.references   :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
