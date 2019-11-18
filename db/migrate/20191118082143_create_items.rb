class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.string :size
      t.string :usage_status, null:false
      t.text :description, null:false
      t.string :selling_status, null:false
      t.string :delivery_fee, null:false
      t.string :delivery_way, null:false
      t.string :delivery_area, null:false
      t.string :shipping_date, null:false

      t.references :user, null: false, foreign_key: true
      t.integer :brand_id
      t.integer :category_id

      t.string :payment_status, null:false


      t.timestamps
    end
  end
end
