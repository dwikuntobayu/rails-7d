class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nama
      t.integer :quantity
      t.string :price
      t.text :description

      t.timestamps null: false
    end
  end
end
