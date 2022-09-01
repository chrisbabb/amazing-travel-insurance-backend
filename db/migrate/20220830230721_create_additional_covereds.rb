class CreateAdditionalCovereds < ActiveRecord::Migration[7.0]
  def change
    create_table :additional_covereds do |t|
      t.string :first_name
      t.string :last_name
      t.string :dob
      t.string :relationship
      t.integer :age
      t.integer :policy_id

      t.timestamps
    end
  end
end
