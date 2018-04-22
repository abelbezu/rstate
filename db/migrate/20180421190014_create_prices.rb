class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.belongs_to :listing, index: true
      t.decimal :amount
      t.string :currency # Dollar or Ethiopian Birr
      t.boolean :negotiable
      t.timestamps
    end
  end
end
