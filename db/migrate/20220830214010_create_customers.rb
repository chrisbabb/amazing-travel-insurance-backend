class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :user_level
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :phone
      t.string :dob
      t.references :credit_cards
      t.references :policies

      t.timestamps
    end
  end
end
