class CreateHouseDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :house_details do |t|
      t.belongs_to :listing, index: true
      t.integer :property_type # Whether this listing is apartment or house
      t.integer :floors
      t.integer :bedrooms 
      t.integer :bathrooms
      t.integer :area
      t.timestamps
    end
  end
end
