class RemoveMonthlyAimFromGoals < ActiveRecord::Migration[6.1]
  def change
    remove_column :goals, :monthly_aim, :string
    remove_column :goals, :monthly_indicator, :string
  end
end
