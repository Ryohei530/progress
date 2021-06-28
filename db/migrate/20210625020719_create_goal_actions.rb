class CreateGoalActions < ActiveRecord::Migration[6.1]
  def change
    create_table :goal_actions do |t|
      t.string :content
      t.integer :number
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
