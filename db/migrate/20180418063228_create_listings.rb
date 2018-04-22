class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.string :listing_for
      t.timestamps
    end
  end
end
