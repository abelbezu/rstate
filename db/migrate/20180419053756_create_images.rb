class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :image_owner, polymorphic: true, index: true
      t.string :alternate_text
      t.string :image
      t.timestamps
    end
  end
end
