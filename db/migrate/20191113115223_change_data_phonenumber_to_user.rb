class ChangeDataPhonenumberToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phonenumber, :string, unique: true
  end
end
