class RemoveGoalRefFromGoalActions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :goal_actions, :goal, null: false, foreign_key: true
  end
end
