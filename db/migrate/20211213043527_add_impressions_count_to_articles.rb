class AddImpressionsCountToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :impressions_count, :integer, default: 0
  end
end
