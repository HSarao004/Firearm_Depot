class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity_available
      t.references :category, null: false, foreign_key: true
      t.string :leftside_img
      t.string :rightside_img
      t.string :front_img
      t.string :back_img

      t.timestamps
    end
  end
end
