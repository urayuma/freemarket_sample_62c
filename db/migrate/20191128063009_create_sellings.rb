class CreateSellings < ActiveRecord::Migration[5.2]
  def change
    create_table :sellings do |t|

      t.timestamps
    end
  end
end
