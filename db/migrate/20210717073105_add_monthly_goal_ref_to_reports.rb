class AddMonthlyGoalRefToReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :monthly_goal, null: false, foreign_key: true
  end
end
