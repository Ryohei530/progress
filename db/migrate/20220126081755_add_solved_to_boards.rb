class AddSolvedToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :solved, :boolean, default: false, null: false
  end
end
