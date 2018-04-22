class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.belongs_to :listing, index: true
      t.string :city
      t.string :neighborhood
      t.timestamps
    end
  end
end
