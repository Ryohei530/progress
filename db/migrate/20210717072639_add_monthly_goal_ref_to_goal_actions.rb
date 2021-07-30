class AddMonthlyGoalRefToGoalActions < ActiveRecord::Migration[6.1]
  def change
    add_reference :goal_actions, :monthly_goal, null: false, foreign_key: true
  end
end
