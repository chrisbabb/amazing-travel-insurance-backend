class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :coverage_level
      t.integer :price
      t.integer :fee
      t.integer :price_total
      t.integer :policy_id
      t.timestamps
    end
  end
end
