class ChangeColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    add_index :addresses, :home_call_num, unique: true
  end
end
