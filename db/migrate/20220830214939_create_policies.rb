class CreatePolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :policies do |t|
      t.integer :policy_number
      t.string :purchase_date
      t.string :start_date
      t.string :end_date
      t.references :additional_covereds
      t.integer :product_id
      t.integer :affiliate_id
      t.integer :sub_affiliate_id

      t.timestamps
    end
  end
end
