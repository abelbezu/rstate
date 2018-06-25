class CreateInterestIndications < ActiveRecord::Migration[5.1]
  def change
    create_table :interest_indications do |t|
      t.belongs_to :guest
      t.belongs_to :listing
      t.text :body
      t.timestamps
    end
  end
end
