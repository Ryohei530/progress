class CreateReportLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :report_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
