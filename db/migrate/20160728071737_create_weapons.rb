class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :tipe
      t.text :description
      t.string :weight
      t.string :dimention

      t.timestamps null: false
    end
  end
end
