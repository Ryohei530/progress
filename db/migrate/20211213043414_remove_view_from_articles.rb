class RemoveViewFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :view, :integer
  end
end
