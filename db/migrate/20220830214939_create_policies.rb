class CreatePolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :policies do |t|
      t.integer :policy_number
      t.string :purchase_date
      t.string :start_date
      t.string :end_date
      t.integer :customer_id
      t.references :product
      t.references :additional_covereds

      t.timestamps
    end
  end
end
