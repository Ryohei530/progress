class AddRDaysToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :r_days, :integer
  end
end
