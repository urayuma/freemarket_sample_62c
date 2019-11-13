class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :phonenumber, unique: true
  end
end
