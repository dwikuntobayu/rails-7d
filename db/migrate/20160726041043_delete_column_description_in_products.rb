class DeleteColumnDescriptionInProducts < ActiveRecord::Migration
  def change
    remove_column :products, :description, :text
  end
end
