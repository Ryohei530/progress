class CreateMonthlyGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_goals do |t|
      t.string :monthly_aim
      t.string :monthly_indicator
      t.date :term_start
      t.date :term_end
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
