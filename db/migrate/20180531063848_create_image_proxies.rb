class CreateImageProxies < ActiveRecord::Migration[5.1]
  def change
    create_table :image_proxies do |t|
      t.references :proxy_owner, polymorphic: true, index: true
      t.string :image_id
      t.string :image_url
      t.text :data
      t.timestamps
    end
  end
end
