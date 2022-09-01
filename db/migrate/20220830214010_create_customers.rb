class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password
      t.string :password_confirmation
      t.string :address
      t.string :address_two
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :province
      t.integer :home_phone
      t.integer :mobile_phone
      t.string :dob
      t.integer :age
      t.string :billing_address
      t.string :billing_address_two
      t.string :billing_city
      t.string :billing_state
      t.string :billing_postal_code
      t.references :credit_cards
      t.references :policies

      t.timestamps
    end
  end
end
