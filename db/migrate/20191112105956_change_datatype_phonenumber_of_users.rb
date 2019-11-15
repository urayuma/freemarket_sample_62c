class ChangeDatatypePhonenumberOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phonenumber, :string
  end
end
