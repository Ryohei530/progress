class CreateRunningDays < ActiveRecord::Migration[6.1]
  def change
    create_table :running_days do |t|
      t.date :start_date
      t.date :date
      t.boolean :s_or_c
      t.integer :r_days
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
