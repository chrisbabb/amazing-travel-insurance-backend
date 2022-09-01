class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.string :number
      t.string :last_four
      t.string :exp_day
      t.string :exp_year
      t.string :cvv
      t.integer :customer_id
      t.timestamps
    end
  end
end
