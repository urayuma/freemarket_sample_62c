class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, null: false,foreign_key: true
      t.string :lastname,        null: false
      t.string :firstname,       null: false
      t.string :lastname_kana,   null: false
      t.string :firstname_kana,  null: false
      t.string :postcode,        null: false
      t.string :prefectures,     null: false
      t.string :city,            null: false
      t.string :street_num,      null: false
      t.string :building
      t.string :home_call_num
      t.timestamps
    end
  end
end
