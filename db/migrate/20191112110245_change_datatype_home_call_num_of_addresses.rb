class ChangeDatatypeHomeCallNumOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :home_call_num, :string
  end
end
