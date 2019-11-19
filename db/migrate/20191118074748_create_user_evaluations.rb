class CreateUserEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_evaluations do |t|
      t.string :rate,        null: false
      t.references :order,   null: false, foreign_key: true
      t.text  :text

      t.timestamps
    end
  end
end
