class CreateBoardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :board_comments do |t|
      t.text :content
      t.integer :reply_id
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
