class AddProductIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :product_id, :integer
  end
end
