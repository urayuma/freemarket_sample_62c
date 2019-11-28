class CreateUsageStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :usage_statuses do |t|

      t.timestamps
    end
  end
end
