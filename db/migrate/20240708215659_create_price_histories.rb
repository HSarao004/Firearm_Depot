class CreatePriceHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :price_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :old_price
      t.decimal :new_price
      t.datetime :changed_at

      t.timestamps
    end
  end
end
