class CreateUsers < ActiveRecord::Migration[5.1]
  # Consider adding a json field where users can store further details
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.timestamps
    end
  end
end
