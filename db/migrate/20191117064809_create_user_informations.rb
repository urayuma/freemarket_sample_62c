class CreateUserInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.references :user, foreign_key: true
      t.string :postcode
      t.string :prefectures
      t.string :city
      t.string :street_num
      t.string :building

      t.timestamps
    end
  end
end
