class CreateReportActions < ActiveRecord::Migration[6.1]
  def change
    create_table :report_actions do |t|
      t.integer :number
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
