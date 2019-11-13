class ChangeDataHomeCallNumToAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :home_call_num, :string, unique: true
  end
end
