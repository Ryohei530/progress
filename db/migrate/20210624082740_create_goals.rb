class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :aim
      t.string :indicator
      t.string :monthly_aim
      t.string :monthly_indicator
      t.date :term_start
      t.date :term_end

      t.timestamps
    end
  end
end
