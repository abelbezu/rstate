class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :alternate_text
      t.string :image
      t.timestamps
    end
  end
end
