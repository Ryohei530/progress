class CreateReportComments < ActiveRecord::Migration[6.1]
  def change
    create_table :report_comments do |t|
      t.text :content
      t.integer :reply_id
      t.references :user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
