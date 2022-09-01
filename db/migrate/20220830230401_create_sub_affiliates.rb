class CreateSubAffiliates < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_affiliates do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone
      t.string :email
      t.string :link
      t.integer :affiliate_id
      t.references :policies

      t.timestamps
    end
  end
end
